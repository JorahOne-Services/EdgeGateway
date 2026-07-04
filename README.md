<div align="center">
  <img src="https://img.shields.io/badge/Raspberry%20Pi-A22846?style=for-the-badge&logo=raspberrypi&logoColor=white">
  <img src="https://img.shields.io/badge/Cloudflare%20WARP-F38020?style=for-the-badge&logo=cloudflare&logoColor=white">
  <img src="https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black">
  <img src="https://img.shields.io/badge/HTML5-E34F26?style=for-the-badge&logo=html5&logoColor=white">
</div>

<br>

<div align="center">
  <h1>🌐 EdgeGateway</h1>
  <p><strong>Raspberry Pi Cloudflare WARP Gateway</strong></p>
  <p>Secure tunneling, DNS privacy, and outbound proxy for edge devices</p>
  <p>
    <a href="#-features">Features</a> •
    <a href="#-quick-start">Quick Start</a> •
    <a href="#-installation">Installation</a>
  </p>
</div>

---

## ✨ Features

- **Cloudflare WARP** — Secure tunneling and DNS privacy
- **Raspberry Pi Optimized** — Lightweight ARM architecture support
- **Two-Step Provisioning** — Install, then configure
- **Connection Dashboard** — Lightweight HTML dashboard for WARP status
- **Outbound Proxy** — Route all traffic through WARP

## 🚀 Quick Start

```bash
git clone https://github.com/OneByJorah/EdgeGateway.git
cd EdgeGateway
chmod +x 01_install.sh 02_configure.sh
sudo ./01_install.sh
sudo ./02_configure.sh
```

## 🔧 Installation Steps

### 01_install.sh
- Installs dependencies and Cloudflare WARP client
- Configures system for ARM architecture

### 02_configure.sh
- Registers WARP client with Cloudflare
- Sets up routing and DNS configuration
- Enables WARP service

## 📄 License

MIT © Jhonattan L. Jimenez

---

<div align="center">
  <p>🛡️ Secure edge networking, simplified</p>
  <p><a href="https://github.com/OneByJorah">@OneByJorah</a></p>
</div>
