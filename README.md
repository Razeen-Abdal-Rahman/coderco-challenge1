# CoderCo App Setup

This project sets up a secure and reliable Python HTTP server using systemd, log rotation, firewall rules, and a healthcheck cronjob — all configured and installed using a single `Makefile`.

---

## 📁 Project Structure

```bash
.
├── README.md
└── linux_service
    ├── .env
    ├── coderco-app.logrotate        # logrotate configuration
    ├── coderco-app.service          # systemd service file
    ├── codercohealthcheck.sh        # healthcheck script
    ├── Makefile
    └── server.py 

```

---

## 🚀 What This Setup Does

- Creates a dedicated non-root user `appuser`
- Deploys the Python app (`server.py`) and environment file (`.env`) to `/opt/coderco-app`
- Sets strict permissions so only `appuser` and `root` can access the app directory
- Configures a `coderco-app.service` systemd unit to run the app as `appuser`
- Redirects service logs to `/var/log/coderco-app.log` with log rotation
- Restricts access to port 8080 to localhost only using `ufw` firewall rules
- Includes a healthcheck script with a cronjob that restarts the service if it stops responding

---

## ⚙️ Prerequisites

- Linux system with `sudo` privileges
- `python3` installed
- `ufw` installed and enabled (for firewall rules)
- `curl` installed

---

## ✅ Installation

1.  Clone this repository and `cd` into the `linux_service` folder
2.  run the makefile using `sudo make all` this will:
        - Create user and directories
        - Copy configuration files into system paths
        - Enable firewall rules
        - Install systemd service, logrotate, healthcheck script, and cronjob
        - Start the service and verify it is running

---

## 🎯 Makefile Targets

| Target             | What it does                                                   |
| ------------------ | -------------------------------------------------------------- |
| make all           | complete setup including firewall and healthcheck and cron     |
| make setup         | core setup (user, app, systemd service, logs)                  |
| make firewall      | configures UFW firewall rules                                  |
| make healthcheck   | creates the healthcheck script                                 |
| make cron          | installs cronjob for healthcheck                               |
| make check_service | verifies app HTTP response and systemd service status          |
| make clean         | stops service and removes all setup files and user             |

---

## 🩹 Healthcheck Script

Runs every 5 minutes, checking if the app responds on port 8080. If the check fails, it restarts the service and logs the event.

---

## 🧱 Firewall Rules

Using UFW, only allows local connections to port 8080 to restrict external access.

---

## 📝 Notes

- If `ufw` is not installed or enabled, the firewall rules step will fail. Install and enable `ufw` beforehand:
```
sudo apt install ufw
sudo ufw enable
```

- The Python app uses environment variables from `.env`. Modify this file to change `PORT` or log location.

- logrotate settings can be modified by editing the `coderco-app.logrotate` file before using the `make all` command

