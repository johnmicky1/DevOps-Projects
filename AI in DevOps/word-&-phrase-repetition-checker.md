# 📌 Text Analysis: Word and Phrase Repetition Checker

```python
import re  # Regular expressions for text tokenization
from collections import Counter  # To count occurrences of words and phrases
```

---

```python
print("Paste your text below. End with a blank line:")  
# Prompt the user to input multiple lines of text
```

---

```python
lines = []  # Initialize a list to store each line of input
while True:
    try:
        line = input()  # Read user input line by line
    except EOFError:
        break  # Stop if end-of-file is reached (Ctrl+D)
    if line.strip() == "":
        break  # Stop if an empty line is entered
    lines.append(line)  # Add the input line to the list
text = "\n".join(lines)  # Combine all lines into a single string
```

---

```python
# --- tokenize & normalize ---
tokens = re.findall(r"[A-Za-z]+(?:'[A-Za-z]+)?", text.lower())
# Extract words from text, convert to lowercase, keeping contractions (like "don't")
```

---

```python
# common stopwords to de-emphasize
stop = {
  'the','a','an','and','of','to','in','is','it','for','on','with','as','that','this',
  'are','be','was','were','by','or','from','at','we','you','i','they','he','she','not','but'
}
# These words are ignored when identifying repeated content words
```

---

```python
# word counts
wc = Counter(tokens)  # Count frequency of all tokens
repeated = {w:c for w,c in wc.items() if c > 1}  # Keep words appearing more than once
repeated_no_stop = {w:c for w,c in wc.items() if c > 1 and w not in stop}  
# Exclude common stopwords from repeated words
```

---

```python
# n-gram helpers
def ngrams(tok, n):
    return [' '.join(tok[i:i+n]) for i in range(len(tok)-n+1)]
# Function to generate all n-grams from token list
```

---

```python
big = Counter(ngrams(tokens, 2))  # Count all bigrams (2-word sequences)
tri = Counter(ngrams(tokens, 3))  # Count all trigrams (3-word sequences)
rep_big = {k:v for k,v in big.items() if v > 1}  # Keep repeated bigrams
rep_tri = {k:v for k,v in tri.items() if v > 1}  # Keep repeated trigrams
```

---

```python
# --- report ---
total = len(tokens) or 1  # Total words (avoid division by zero)
print("\n=== SUMMARY ===")
print(f"Total words: {total}")
print(f"Unique words: {len(wc)}")  # Count unique words
```

---

```python
if repeated_no_stop:
    print("\nTop repeated words (excluding common stopwords):")
    for w,c in sorted(repeated_no_stop.items(), key=lambda x: (-x[1], x[0]))[:15]:
        pct = 100*c/total
        print(f"  {w:<15} {c:>3}  ({pct:4.1f}%)")  
        # Print word, count, and percentage of total words
else:
    print("\nNo repeated content-words found.")
```

---

```python
if rep_big:
    print("\nRepeated phrases (bigrams):")
    for p,c in sorted(rep_big.items(), key=lambda x: (-x[1], x[0]))[:10]:
        print(f"  {p:<30} {c}")  # Print repeated bigrams and counts
if rep_tri:
    print("\nRepeated phrases (trigrams):")
    for p,c in sorted(rep_tri.items(), key=lambda x: (-x[1], x[0]))[:10]:
        print(f"  {p:<30} {c}")  # Print repeated trigrams and counts
```

---

```python
# Gentle style hints
if repeated_no_stop:
    top_w, top_c = max(repeated_no_stop.items(), key=lambda x: x[1])
    if (top_c / total) >= 0.05:
        print(f"\nHint: The word '{top_w}' appears {top_c} times ({100*top_c/total:.1f}%). "
              "Consider varying wording or using synonyms to reduce repetition.")
```

---

```python
print("\nDone.")  # Indicate the script has finished
```

---

## ✅ Sample Output

```
Paste your text below. End with a blank line:
Students worked on a project about climate data. The project required students to clean data, explore data, and present results. During analysis, the team ran an analysis of errors and an analysis of trends. The model was simple, but the model produced useful feedback for the students. After the first prototype, the team refined the prototype and shared results in class. In the final review, the project summary highlighted analysis choices, model limits, and next steps.


=== SUMMARY ===
Total words: 76
Unique words: 47

Top repeated words (excluding common stopwords):
  analysis          4  ( 5.3%)
  data              3  ( 3.9%)
  model             3  ( 3.9%)
  project           3  ( 3.9%)
  students          3  ( 3.9%)
  prototype         2  ( 2.6%)
  results           2  ( 2.6%)
  team              2  ( 2.6%)

Repeated phrases (bigrams):
  an analysis                    2
  analysis of                    2
  the model                      2
  the project                    2
  the team                       2

Repeated phrases (trigrams):
  an analysis of                 2

Hint: The word 'analysis' appears 4 times (5.3%). Consider varying wording or using synonyms to reduce repetition.
