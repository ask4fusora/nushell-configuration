def "nu-complete wezterm ssh proxy" [] {
  ["cloudflared"]
}

export def --wrapped "wezterm ssh" [
  --proxy: string@"nu-complete wezterm ssh proxy" # Proxy backend to utilize.
  ...rest
] {
  if $proxy == null {
    ^wezterm ssh ...$rest
    return
  }

  match $proxy {
    "cloudflared" => {
      ^wezterm ssh -o 'ProxyCommand=cloudflared access ssh --hostname %h' ...$rest
    }
    _ => {
      error make {
        msg: $'Invalid proxy backend: "($proxy)". Allowed values: "cloudflared".'
        labels: [
          {
            text: 'allowed values: "cloudflared"'
            span: (metadata $proxy).span
          }
        ]
      }
    }
  }
}
