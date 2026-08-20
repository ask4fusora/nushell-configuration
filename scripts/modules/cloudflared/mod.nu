export def "cloudflared tunnel dns delete" [] {
  require-executable fzf

  let cert_path = (
    # See https://developers.cloudflare.com/cloudflare-one/networks/connectors/cloudflare-tunnel/configure-tunnels/run-parameters/#origincert.
    $env.TUNNEL_ORIGIN_CERT?
    | default ($nu.home-dir | path join ".cloudflared" "cert.pem")
  )

  let credentials = (
    open --raw $cert_path
    | lines
    | skip until {|line| $line == "-----BEGIN ARGO TUNNEL TOKEN-----" }
    | skip 1
    | take until {|line| $line == "-----END ARGO TUNNEL TOKEN-----" }
    | str join
    | decode base64
    | decode
    | from json
  )

  let headers = {Authorization: $"Bearer ($credentials.apiToken)"}

  let api = $"https://api.cloudflare.com/client/v4/zones/($credentials.zoneID)/dns_records"

  let query = {type: CNAME, per_page: 5000} | url build-query

  let records = (
    http get --headers=$headers $"($api)?($query)"
    | get result
    | where content =~ '\.cfargotunnel\.com\.?$'
  )

  if ($records | is-empty) {
    error make {msg: "No Cloudflare Tunnel DNS records found."}
  }

  let separator = char tab

  let rows = (
    $records
    | each {|record|
      let proxied_str = if $record.proxied {
        "proxied"
      } else {
        "DNS only"
      }

      [
        $record.id
        $"($record.name) - ($proxied_str)"
      ]
      | str join $separator
    }
    | str join (char nl)
  )

  let selection = (
    $rows
    | ^fzf
    --delimiter $separator
    --with-nth "2.."
    | complete
  )

  if $selection.exit_code != 0 {
    return
  }

  let record_id = (
    $selection.stdout
    | str trim
    | split row $separator
    | first
  )

  let record = (
    $records
    | where id == $record_id
    | first
  )

  let response = (
    http delete
    --headers=$headers
    $"($api)/($record.id)"
  )

  {deleted: $record.name, target: $record.content, id: $response.result.id}
}
