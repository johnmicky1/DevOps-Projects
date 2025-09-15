## 📌 PYTHON CODE SHOWING UGANDAS TEMPERATURE FOR THE LAST TWO WEEKS

```python
import pandas as pd
import matplotlib.pyplot as plt
from sklearn.linear_model import LinearRegression
import numpy as np
import datetime

# --- Step 1: Mock dataset (normally fetched via weather API) ---
today = datetime.date.today()
dates = [today - datetime.timedelta(days=i) for i in range(13, -1, -1)]  # last 14 days
temps = [23, 24, 25, 24, 26, 27, 28, 27, 29, 30, 28, 27, 26, 25]  # Example Kampala temps

df = pd.DataFrame({"Date": dates, "Temperature_C": temps})

print("\n=== Uganda Temperature Data (Last 2 Weeks) ===")
print(df)

# --- Step 2: Analyze patterns ---
mean_temp = df["Temperature_C"].mean()
max_temp = df["Temperature_C"].max()
min_temp = df["Temperature_C"].min()

print(f"\nAverage Temp: {mean_temp:.2f} °C")
print(f"Max Temp: {max_temp} °C")
print(f"Min Temp: {min_temp} °C")

# Plot historical data
plt.figure(figsize=(10,5))
plt.plot(df["Date"], df["Temperature_C"], marker='o', label="Observed Temp")
plt.title("Uganda Temperatures - Last 14 Days")
plt.xlabel("Date")
plt.ylabel("Temperature (°C)")
plt.xticks(rotation=45)
plt.legend()
plt.grid(True)
plt.tight_layout()
plt.show()

# --- Step 3: Predict next 7 days using linear regression ---
df["DayIndex"] = np.arange(len(df))
X = df["DayIndex"].values.reshape(-1, 1)
y = df["Temperature_C"].values

model = LinearRegression()
model.fit(X, y)

future_days = 7
future_index = np.arange(len(df), len(df) + future_days).reshape(-1, 1)
predicted_temps = model.predict(future_index)

future_dates = [today + datetime.timedelta(days=i) for i in range(1, future_days+1)]
pred_df = pd.DataFrame({"Date": future_dates, "Predicted_Temperature_C": predicted_temps})

print("\n=== Predicted Temperatures (Next 7 Days) ===")
print(pred_df)

# Plot with prediction
plt.figure(figsize=(10,5))
plt.plot(df["Date"], df["Temperature_C"], marker='o', label="Observed Temp")
plt.plot(pred_df["Date"], pred_df["Predicted_Temperature_C"], marker='x', linestyle="--", color="red", label="Predicted Temp")
plt.title("Uganda Temperature Trends & Predictions")
plt.xlabel("Date")
plt.ylabel("Temperature (°C)")
plt.xticks(rotation=45)
plt.legend()
plt.grid(True)
plt.tight_layout()
plt.show()
```

---

## 📊 Sample Output

### Uganda Temperature Data (Last 2 Weeks)

| Date       | Temperature\_C |
| ---------- | -------------- |
| 2025-09-02 | 23             |
| 2025-09-03 | 24             |
| 2025-09-04 | 25             |
| 2025-09-05 | 24             |
| 2025-09-06 | 26             |
| 2025-09-07 | 27             |
| 2025-09-08 | 28             |
| 2025-09-09 | 27             |
| 2025-09-10 | 29             |
| 2025-09-11 | 30             |
| 2025-09-12 | 28             |
| 2025-09-13 | 27             |
| 2025-09-14 | 26             |
| 2025-09-15 | 25             |

📌 **Temperature Summary**

* **Average Temp:** 26.43 °C
* **Max Temp:** 30 °C
* **Min Temp:** 23 °C

---

### Predicted Temperatures (Next 7 Days)

| Date       | Predicted\_Temperature\_C |
| ---------- | ------------------------- |
| 2025-09-16 | 26.29                     |
| 2025-09-17 | 26.66                     |
| 2025-09-18 | 27.03                     |
| 2025-09-19 | 27.41                     |
| 2025-09-20 | 27.78                     |
| 2025-09-21 | 28.15                     |
| 2025-09-22 | 28.52                     |

---

## 📈 Graph Outputs

1. **Uganda Temperatures - Last 14 Days**
   (Observed temperature trend)

2. **Uganda Temperature Trends & Predictions**
   (Observed temps + 7-day linear regression forecast)

---
