# EdgeGateway — Cloudflare WARP Edge Gateway

**Provision Cloudflare WARP on Linux edge devices with automated install, registration, and local status monitoring.**

![License](https://img.shields.io/badge/License-MIT-FFB300.svg?style=for-the-badge)
![Status](https://img.shields.io/badge/Status-Active_Development-FFB300.svg?style=for-the-badge)
![Language](https://img.shields.io/badge/Language-Bash-FFB300.svg?style=for-the-badge)
![Stack](https://img.shields.io/badge/Stack-Cloudflare_WARP-FFB300.svg?style=for-the-badge)
![Platform](https://img.shields.io/badge/Platform-Linux-FFB300.svg?style=for-the-badge)

EdgeGateway provisions Cloudflare WARP on Linux edge devices and Raspberry Pi hosts to provide secure tunneling, DNS privacy, and outbound proxy functionality. A lightweight local dashboard exposes WARP state, and a two-step installer automates client deployment. The repository targets low-power ARM and x86 hosts requiring zero-trust egress.

- Automated WARP client installation and registration.
- Two-step POSIX-sh compatible bootstrap scripts.
- Local HTML dashboard for connection state visibility.
- Editable dashboard templates for custom slicing.

- Install WARP client and dependencies with `01_install.sh`.
- Register device and configure routing mode with `02_configure.sh`.
- Monitor connection state through the local HTML dashboard.
- Extend dashboard templates without editing provisioning logic.

```
Host (Linux/arm64)
  └── Cloudflare WARP client (warp-svc)
        └── Internet
Local browser → templates/dashboard.html → warp-cli status
```

### Technology Stack

- **Runtime**: Linux (Ubuntu 22.04+, Raspberry Pi OS)
- **Provisioning**: Bash / Cloudflare WARP client
- **Frontend**: HTML5 Dashboard (`templates/dashboard.html`)
- **VCS**: Git + GitHub

### Quickstart

1. Clone the repository.
   ```bash
   git clone https://github.com/OneByJorah/EdgeGateway.git
   cd EdgeGateway
   ```
2. Install the WARP client and dependencies.
   ```bash
   # Review scripts before executing on production devices.
   sudo ./01_install.sh
   ```
3. Register and configure the client.
   ```bash
   sudo ./02_configure.sh
   ```
4. Verify WARP status.
   ```bash
   sudo warp-cli status
   ```

### Roadmap

- [ ] Add systemd unit for automatic startup
- [ ] Add health check endpoint for dashboard polling
- [ ] Provide Ansible role for fleet deployment
- [ ] Add automatic update mechanism for WARP client

### License

MIT © JorahOne, LLC

---

*Built by [JorahOne, LLC](https://github.com/JorahOne-Services) — network security, AD/M365, and infrastructure automation for SMBs and public sector.*
