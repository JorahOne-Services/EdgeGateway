# WarpGate (EdgeGateway)

Raspberry Pi Cloudflare WARP gateway — secure tunneling, DNS privacy, and outbound proxy for edge devices.

![status](https://img.shields.io/badge/status-active-FFB300?style=flat-square)
![platform](https://img.shields.io/badge/platform-raspberry%20pi-0d0d0c?style=flat-square)
![license](https://img.shields.io/badge/license-MIT-FFB300?style=flat-square)

## Overview

WarpGate (branded "EdgeGateway") is a self-hosted Cloudflare WARP gateway optimized for Raspberry Pi. It provides secure tunneling, DNS-over-HTTPS privacy, and outbound proxy for edge devices through a two-step provisioning process. A lightweight Flask dashboard monitors WARP connection status in real time.

## Features

- Cloudflare WARP — secure tunneling and DNS privacy for all traffic
- Raspberry Pi optimized — lightweight ARM architecture support
- Two-step provisioning — install dependencies, then configure WARP
- Connection dashboard — Flask + SocketIO for real-time WARP status monitoring
- Outbound proxy — route all traffic through Cloudflare WARP
- Privacy-first — DNS over HTTPS with Cloudflare 1.1.1.1

## Architecture / Tech Stack

- **Gateway**: Cloudflare WARP client
- **Dashboard**: Flask + Flask-SocketIO
- **Platform**: Raspberry Pi (ARM), Linux
- **DNS**: Cloudflare 1.1.1.1 (DoH)

## Installation

```bash
git clone https://github.com/OneByJorah/WarpGate.git
cd WarpGate

sudo ./01_install.sh   # Install dependencies + WARP client
sudo ./02_configure.sh # Register, configure routing, start service
```

## Dashboard

After installation, access the dashboard at `http://<pi-ip>:5000` to monitor WARP connection status, latency, and traffic.

## License

MIT — see [LICENSE](LICENSE).

---
Part of the JorahOne / J1 ecosystem — secure edge networking for self-hosted infrastructure.
