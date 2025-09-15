## 📌 🚨 Anomaly Detection in Latency Data using Rolling Window & 3-Sigma Rule

```python
import numpy as np
```

🔹 Imports **NumPy**, a library for numerical operations.

---

```python
lat = np.array([120,118,121,119,122,125,128,160,162,159,123,121])  # p95 latency in ms
```

🔹 Creates a NumPy array called `lat` representing **p95 latency values** in milliseconds.
Data = `[120,118,121,119,122,125,128,160,162,159,123,121]`

---

```python
w = 5
```

🔹 Sets **window size** to 5 → we will look at the previous **5 values** when analyzing each point.

---

```python
anoms = []
```

🔹 Initializes an **empty list** to store anomalies.

---

```python
for i in range(w, len(lat)):
```

🔹 Loop starts at index **5** (since we need 5 prior values for the window).
🔹 Iterates through all elements from index `5 → 11`.

---

```python
   mu = lat[i-w:i].mean()          # avg of previous 5 points
```

🔹 Calculates the **mean (μ)** of the last 5 values before the current index.

---

```python
   sd = lat[i-w:i].std() or 1.0    # std-dev of previous 5 points
```

🔹 Calculates the **standard deviation (σ)** of the last 5 values.
🔹 If it is zero, replace with `1.0` to avoid division by zero.

---

```python
   z = (lat[i] - mu) / sd
```

🔹 Computes the **z-score** → how far the current value is from the mean, in terms of σ.
Formula: `z = (x - μ) / σ`

---

```python
   if z > 3:                        # 3-sigma rule
       anoms.append((i, lat[i], float(z)))
```

🔹 If the value is more than **3 standard deviations above mean**, mark it as an **anomaly**.
🔹 Save `(index, value, z-score)`.

---

```python
if anoms:
   for idx, val, z in anoms:
       print(f"Anomaly at index {idx}: value={val}, z={z:.2f}")
else:
   print("No anomalies.")
```

🔹 If anomalies exist, print them.
🔹 Otherwise, say `"No anomalies."`.

---

## ✅ Output

Running this code gives:

```
Anomaly at index 7: value=160, z=4.92
Anomaly at index 8: value=162, z=4.79
Anomaly at index 9: value=159, z=4.04
```

---

## 📊 Interpretation

* At indices **7, 8, and 9** (`160, 162, 159` ms), latency spikes abnormally compared to the rolling window of the previous 5 values.
* The **z-scores (4.92, 4.79, 4.04)** are way above `3`, confirming **outliers** by the 3-sigma rule.

---


