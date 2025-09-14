````markdown
# Linux Scenario-Based Practice Activity

This activity simulates working with log files in Linux. The goal is to create logs, list them, extract errors, and count the total number of errors using only **five commands**:  
`mkdir`, `cat`, `ls`, `grep`, and `wc`.

---

## Step 1: Create a Workspace

I created a workspace with directories for the logs:

```bash
mkdir -p lab/logs/day1 lab/logs/day2
````

---

## Step 2: Create Log Files

Next, I used the `cat` command with **here-documents** to create three log files containing sample log entries.

```bash
cat > lab/logs/day1/sysA.log <<'EOF'
2025-08-23 09:01 INFO init
2025-08-23 09:02 ERROR db: connection refused
2025-08-23 09:05 WARN memory high
2025-08-23 09:06 ERROR auth: invalid token
EOF

cat > lab/logs/day1/sysB.log <<'EOF'
2025-08-23 09:10 INFO job started
2025-08-23 09:12 ERROR disk full
2025-08-23 09:13 ERROR db: timeout
2025-08-23 09:14 INFO job aborted
EOF

cat > lab/logs/day2/sysC.log <<'EOF'
2025-08-24 10:00 INFO heartbeat
2025-08-24 10:02 ERROR network: unreachable
2025-08-24 10:03 WARN cpu high
2025-08-24 10:05 ERROR auth: expired
2025-08-24 10:06 ERROR db: locked
EOF
```

---

## Step 3: List the Log Tree

I listed the contents of the `lab/logs` directory recursively with `ls -lR`:

```bash
ls -lR lab/logs
```
I got the output below
$ ls -lR lab/logs

lab/logs:
total 0
drwxr-xr-x 1 johnm 197609 0 Sep 15 01:16 day1/
drwxr-xr-x 1 johnm 197609 0 Sep 15 01:16 day2/

lab/logs/day1:
total 2
-rw-r--r-- 1 johnm 197609 150 Sep 15 01:16 sysA.log
-rw-r--r-- 1 johnm 197609 136 Sep 15 01:16 sysB.log

lab/logs/day2:
total 1
-rw-r--r-- 1 johnm 197609 178 Sep 15 01:16 sysC.log

---

### 📂 Directory Structure (Tree View)

For better visualization, here’s the directory structure in a tree view:

```
lab/
└── logs/
    ├── day1/
    │   ├── sysA.log
    │   └── sysB.log
    └── day2/
        └── sysC.log
```

---

## Step 4: Extract All Error Lines

I used the `grep` command to find all lines containing `"ERROR"` across all log files:

```bash
grep -R "ERROR" lab/logs
```

**Output:**

```
lab/logs/day1/sysA.log:2025-08-23 09:02 ERROR db: connection refused
lab/logs/day1/sysA.log:2025-08-23 09:06 ERROR auth: invalid token
lab/logs/day1/sysB.log:2025-08-23 09:12 ERROR disk full
lab/logs/day1/sysB.log:2025-08-23 09:13 ERROR db: timeout
lab/logs/day2/sysC.log:2025-08-24 10:02 ERROR network: unreachable
lab/logs/day2/sysC.log:2025-08-24 10:05 ERROR auth: expired
lab/logs/day2/sysC.log:2025-08-24 10:06 ERROR db: locked
```

---

## Step 5: Count Total Error Lines

Finally, I piped the output of `grep` into `wc -l` to count the total number of error lines:

```bash
grep -R "ERROR" lab/logs | wc -l
```

**Output:**

```
7
```

This shows that there are **7 error lines** across all log files.

---

## ✅ Summary

* Workspace created with `mkdir`.
* Logs created with `cat`.
* Directory contents listed with `ls`.
* Errors extracted with `grep`.
* Total errors counted with `wc`.

**Total errors found: 7**

```

---

