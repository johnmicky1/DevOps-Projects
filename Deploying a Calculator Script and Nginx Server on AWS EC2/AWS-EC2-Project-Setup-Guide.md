# AWS EC2 Project Setup Guide

This guide walks through launching an EC2 instance, setting up Python projects, running scripts, and configuring a basic Nginx web server.

---

## Step 1: Launch an EC2 Instance

1. Log in to the **AWS console** and navigate to the **EC2 dashboard**.
2. Click **Launch Instance** and select **Ubuntu** as the operating system.
3. Choose the **instance type** and configure the **security group** to allow:
   - HTTP (port 80)
   - HTTPS (port 443)
   - SSH (port 22)
4. Download and save the **key pair** (e.g., `ansi-key.pem`) to your desktop.

---

## Step 2: Connect to the EC2 Instance

Navigate to the folder where you saved your key pair, then connect:

```bash
ssh -i "/c/Users/DELL/Desktop/ansi-key.pem" ubuntu@100.26.45.132
````

👉 Replace the path and IP address with your own.

---

## Step 3: Install Dependencies

Update system packages and install Python dependencies:

```bash
sudo apt update
python3 --version
pip3 --version || sudo apt install -y python3-pip
sudo apt install -y python3-venv
```

---

## Step 4: Create a Virtual Environment and Install Packages

1. Create a project directory and enter it:

```bash
mkdir -p ~/calcapp && cd ~/calcapp
```

2. Create and activate a virtual environment:

```bash
python3 -m venv .venv
source .venv/bin/activate
```

3. Install required Python packages:

```bash
pip install numpy pandas
```

---

## Step 5: Create a Calculation Script

1. Create a new file called **calculation.py**:

```bash
nano calculation.py
```

2. Paste the following code:

```python
import argparse
import math
from functools import reduce
import operator

def add(nums):
    return sum(nums)

def sub(nums):
    return reduce(operator.sub, nums)

def mul(nums):
    return math.prod(nums)

def div(nums):
    try:
        return reduce(operator.truediv, nums)
    except ZeroDivisionError:
        raise ValueError("Division by zero encountered.")

OPS = {
    "add": add,
    "sub": sub,
    "mul": mul,
    "div": div,
}

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Simple CLI calculator")
    parser.add_argument("--op", choices=OPS.keys(), required=True, help="Operation")
    parser.add_argument("numbers", nargs="+", type=float, help="Numbers to operate on")
    args = parser.parse_args()
    result = OPS[args.op](args.numbers)
    print(result)
```

3. Save with **Ctrl+O**, then press **Enter**, and exit with **Ctrl+X**.

---

## Step 6: Run the Calculation Script

Run an example calculation:

```bash
python3 calculation.py --op add 2 3 4
```

✅ Expected output:

```
9.0
```

---

## Step 7: Create a Chat Box Script

1. Create a new Python script:

```bash
nano chatbox.py
```

2. Paste the following code:

```python
print("Welcome to the Chat Box!\n")
name = input("What is your name? ")
country = input("Which country are you from? ")
hobbies = input("What are your hobbies? ")

print("\n--- Chat Box Summary ---")
print(f"Hello {name}!")
print(f"You are from {country}.")
print(f"Your hobbies are: {hobbies}.")
print("\nThanks for sharing!")
```

3. Save and exit.
4. Run the script:

```bash
python3 chatbox.py
```

---

## Step 8: Install and Configure Nginx

1. Install Nginx:

```bash
sudo apt update -y
sudo apt install -y nginx
```

2. Create a new web page:

```bash
sudo nano /var/www/html/index.html
```

3. Paste the following HTML:

```html
<!DOCTYPE html>
<html>
<head>
    <title>Technology Devices</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 40px;
            background-color: #f4f4f9;
            color: #333;
        }
        h1 {
            color: #0056b3;
        }
        .device {
            border: 1px solid #ccc;
            padding: 15px;
            margin: 15px 0;
            border-radius: 8px;
            background: #fff;
        }
    </style>
</head>
<body>
    <h1>Popular Technology Devices</h1>
    <div class="device">
        <h2>Smartphone</h2>
        <p>Portable device combining communication, internet, and apps into one handheld tool.</p>
    </div>
    <div class="device">
        <h2>Laptop</h2>
        <p>Lightweight computer that allows flexible work and entertainment anywhere.</p>
    </div>
    <div class="device">
        <h2>Tablet</h2>
        <p>Touchscreen device that bridges the gap between smartphones and laptops.</p>
    </div>
</body>
</html>
```

4. Save and exit.

Now open your EC2 instance’s **public IP** in a browser (e.g., `http://100.26.45.132`) to see your webpage.

---

## 📂 Directory Tree Structure

```bash
calcapp/
├── calculation.py
├── chatbox.py
├── .venv/
└── requirements.txt   (optional if you export pip freeze)
```

System web root:

```bash
/var/www/html/
└── index.html
```

---

✅ You now have:

* A working EC2 instance
* Python scripts for calculation and chatbox
* A running Nginx web server serving a custom page

```
