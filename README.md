 SafeSquid Linux System Monitoring Dashboard

This repository contains **two Bash scripts** created for the SafeSquid Linux System Monitoring Challenge. Each script addresses a separate task and provides insights into system resource usage for Linux servers.

---

##  Task Overview

| Task | Description                                                                                        |
| ---- | -------------------------------------------------------------------------------------------------- |
| 1    | Build a full Linux system dashboard that shows all key system metrics in one go.                   |
| 2    | Build a modular dashboard where the user can pass flags (-c, -m, -d, -a) to view specific metrics. |

---

##  Task 1: Full System Monitor Dashboard ===

###  Goal:

Build a Bash script that displays all of the following:

* 🧠 CPU usage and load average
* 📀 Memory usage and swap usage
* 🗀 Disk usage
* 📊 Total number of running processes
* 🔍 Top 5 CPU and memory consuming processes

###  File: `first_script.sh`

### How to Run:

```bash
chmod +x first_script.sh
./first_script.sh
```

### 📈 Sample Output:

```
+----------------------------------------------------------+
|             SYSTEM MONITOR DASHBOARD                     |
+----------------------------------------------------------+
🧠 CPU Usage:
Load Average: 0.05, 0.03, 0.00
CPU Usage: 7%

Memory Usage: 87 MB / 952 MB (9%)
 Swap Usage: No Swap Used

🗀 Disk Usage: 13%

Active Processes: 97
Top 5 Processes (by CPU usage):
USER     PID    %CPU   %MEM   COMMAND
...
```

---

## === Task 2: Modular Monitor with CLI Flags ===

###  Goal:

Create a Bash script that lets users choose what to monitor using CLI options:

| Flag | Description            |
| ---- | ---------------------- |
| `-c` | Show CPU usage         |
| `-m` | Show memory usage      |
| `-d` | Show disk usage        |
| `-a` | Show all metrics       |
| `-h` | Show help/instructions |

### File: `second_script.sh`

###  How to Run:

```bash
chmod +x second_script.sh
./second_script.sh -c    # Only CPU info
./second_script.sh -m    # Only Memory info
./second_script.sh -d    # Only Disk info
./second_script.sh -a    # All info
./second_script.sh -h    # Help message
```

### 📈 Sample Output (with `-a`):

```
🧠 CPU Usage:
Load Average: 0.00, 0.00, 0.00
CPU Usage: 3%

 Memory Usage:
Used: 68 MB / Total: 952 MB (7.1%)

🗀 Disk Usage:
Used: 1.9G / Total: 17G (11% used)
```

---

##  Environment Setup (AWS EC2)

1. Launch EC2 Instance:

   * AMI: Amazon Linux 2
   * Type: t2.micro
   * Storage: Minimum 15 GB
   * Open SSH Port 22

2. Connect to Instance:

```bash
ssh -i your-key.pem ec2-user@<public-ip>
```

3. Create and run scripts:

   * Create two files (`first_script.sh`, `second_script.sh`)
   * Paste code
   * Run with execute permissions

---

##  Repository Structure

```
.
├── first_script.sh        # Task 1: Full dashboard
├── second_script.sh       # Task 2: CLI-based dashboard
└── README.md              # Combined documentation
```

---

##  Author Info

* **Name**: *Shiva*
* **Role**: Cloud Infrastructure Trainee (SafeSquid Challenge)
* **Date**: May 2025

---

## 🔄 Final Note

These scripts offer a lightweight and modular way to inspect system performance directly from the terminal. They are a great starting point for building automated monitoring tools.
