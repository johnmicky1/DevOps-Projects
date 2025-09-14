````markdown
# Ansible Practice Guide on Ubuntu

This guide walks through installing Ansible, creating simple playbooks, running them, and pulling a playbook directly from GitHub.

---

## Step 1: Install Ubuntu and Ansible

1. Go to **Microsoft Store** and search for **Ubuntu 22.04.5 LTS**.  
   Download and install it.  
2. Open Ubuntu and enter a **unique username and password**.  
3. Install Ansible by running the following commands:

```bash
sudo apt install ansible -y
ansible --version
````

### ✅ Expected Output

```bash
ansible [core 2.15.x]
  config file = None
  configured module search path = ['/home/username/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  python version = 3.x.x
```

---

## Step 2: Create a Test Playbook

1. Create a file named `test.yml`:

```bash
nano test.yml
```

2. Paste the following code into the file:

```yaml
---
- name: Test Ansible on localhost
  hosts: localhost
  connection: local
  tasks:
    - name: Create a test file
      copy:
        content: "Hello, Ansible!\n\n"
        dest: /tmp/ansible_test.txt
```

---

## Step 3: Run the Test Playbook

Execute the playbook:

```bash
ansible-playbook test.yml
```

### ✅ Expected Output

```bash
PLAY [Test Ansible on localhost] *****************************************

TASK [Gathering Facts] **************************************************
ok: [localhost]

TASK [Create a test file] ***********************************************
changed: [localhost]

PLAY RECAP **************************************************************
localhost                  : ok=2    changed=1    unreachable=0    failed=0
```

And if you check the file:

```bash
cat /tmp/ansible_test.txt
```

Expected:

```
Hello, Ansible!
```

---

## Step 4: Create a System Info Playbook

1. Create a file named `system_info.yml`:

```bash
nano system_info.yml
```

2. Paste the following code:

```yaml
---
- name: Gather system information
  hosts: localhost
  connection: local
  tasks:
    - name: Get the hostname
      command: hostname
      register: host_output

    - name: Show hostname
      debug:
        msg: "The hostname is {{ host_output.stdout }}"

    - name: Get free memory
      command: free -h
      register: memory_output

    - name: Show memory info
      debug:
        msg: "{{ memory_output.stdout }}"
```

---

## Step 5: Run the System Info Playbook

Run the playbook:

```bash
ansible-playbook system_info.yml
```

### ✅ Expected Output

```bash
PLAY [Gather system information] ****************************************

TASK [Gathering Facts] *************************************************
ok: [localhost]

TASK [Get the hostname] ************************************************
changed: [localhost]

TASK [Show hostname] ***************************************************
ok: [localhost] => {
    "msg": "The hostname is my-ubuntu-vm"
}

TASK [Get free memory] *************************************************
changed: [localhost]

TASK [Show memory info] ************************************************
ok: [localhost] => {
    "msg": "               total        used        free      shared  buff/cache   available
Mem:           7.6G        2.3G        3.5G        300M        1.8G        4.7G
Swap:          2.0G          0B        2.0G"
}

PLAY RECAP *************************************************************
localhost                  : ok=5    changed=2    unreachable=0    failed=0
```

---

## Step 6: Run the GitHub Playbook

Pull and run a playbook directly from GitHub:

```bash
ansible-pull -U https://github.com/SKM-Santro/ansible-demo.git playbook.yml
```

### GitHub Playbook Code

```yaml
---
- name: Demo playbook from GitHub
  hosts: localhost
  connection: local
  gather_facts: false
  tasks:
    - name: Print a hello message
      debug:
        msg: "Hello from ansible-pull on {{ inventory_hostname }}!"
```

### ✅ Expected Output

```bash
PLAY [Demo playbook from GitHub] ****************************************

TASK [Print a hello message] ********************************************
ok: [localhost] => {
    "msg": "Hello from ansible-pull on localhost!"
}

PLAY RECAP **************************************************************
localhost                  : ok=1    changed=0    unreachable=0    failed=0
```

---

## 📂 Directory Tree View

Here’s how your files and outputs look on disk:

```bash
project-directory/
├── test.yml
├── system_info.yml
├── playbook.yml            # pulled from GitHub (ansible-pull)
└── /tmp/
    └── ansible_test.txt    # created by test.yml playbook
```

---

## ✅ Summary

* Installed Ansible on Ubuntu.
* Created and ran a **test playbook** (created `/tmp/ansible_test.txt`).
* Created and ran a **system info playbook** (displayed hostname + memory).
* Pulled and executed a **GitHub-hosted playbook** (printed hello message).
* Visualized project with a **directory tree structure**.

```

---
