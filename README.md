<div align="center">
  <img src="https://img.shields.io/badge/Cloudflare%20WARP-F38020?style=for-the-badge&logo=cloudflare&logoColor=white">
  <img src="https://img.shields.io/badge/Raspberry%20Pi-A22866?style=for-the-badge&logo=raspberry-pi&logoColor=white">
  <img src="https://img.shields.io/badge/license-MIT-blue?style=for-the-badge">
</div>

<br>

<div align="center">
  <h1>WarpGate</h1>
  <p><strong>Raspberry Pi Cloudflare WARP Gateway</strong></p>
  <p>Secure tunneling, DNS privacy, and outbound proxy for edge devices.</p>
  <p>
    <a href="#features">Features</a> •
    <a href="#quick-start">Quick Start</a> •
    <a href="#configuration">Configuration</a> •
    <a href="#contributing">Contributing</a>
  </p>
</div>

---

## Screenshot

![WarpGate Architecture](docs/screenshot.png)
*Cloudflare WARP gateway running on Raspberry Pi.*

## Features

- **Secure Tunneling** — Route all traffic through Cloudflare WARP.
- **DNS Privacy** — Encrypted DNS resolution via Cloudflare.
- **Outbound Proxy** — Transparent proxy for all network devices.
- **Raspberry Pi** — Optimized for Pi 4/5.
- **Zero Config** — Automatic WARP registration.
- **Kill Switch** — Block traffic if WARP disconnects.
- **Split Tunnel** — Choose which traffic goes through WARP.

## Quick Start

### Raspberry Pi

```bash
git clone https://github.com/OneByJorah/WarpGate.git
cd WarpGate

sudo bash setup.sh
sudo systemctl enable warpgate
sudo systemctl start warpgate
```

### Check Status

```bash
warp-cli status
```

## Configuration

| Variable | Default | Description |
|----------|---------|-------------|
| `WARP_MODE` | `warp` | WARP mode (warp/warp+doh) |
| `LISTEN_PORT` | `5000` | Dashboard port |
| `SPLIT_TUNNEL` | `false` | Enable split tunneling |
| `KILL_SWITCH` | `true` | Block traffic on disconnect |

## Architecture

```
Devices ──Gateway──▶ WarpGate ──WARP──▶ Cloudflare ──▶ Internet
                        │
                        ├──▶ DNS Privacy
                        ├──▶ Traffic Encryption
                        └──▶ Dashboard
```

## Project Structure

```
WarpGate/
├── setup.sh               # Pi setup script
├── warpgate/
│   ├── config.py          # Configuration
│   ├── monitor.py         # WARP status monitor
│   └── dashboard.py       # Web dashboard
├── templates/             # HTML templates
├── warpgate.service       # systemd service
└── README.md
```

## Contributing

Contributions are welcome. Please see [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines and [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md) for community standards.

## Security

For security concerns, see [SECURITY.md](SECURITY.md). Please report vulnerabilities to **info@jorahone.com** — do not use public issues.

## License

MIT © Jhonattan L. Jimenez

---

<div align="center">
  <p>Cloudflare WARP gateway for Raspberry Pi.</p>
  <p><a href="https://github.com/OneByJorah">@OneByJorah</a></p>
</div>
