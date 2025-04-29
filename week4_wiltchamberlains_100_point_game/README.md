# 🏀 Week [3] - Visualize Legendary Scoring Performances

## 📝 Challenge Overview
Bring the **greatest scoring performance** to life by visualizing how points were scored across an entire NBA game — second-by-second!

On March 2nd, 1962 Wilt Chamberlain set the [single-game scoring record by scoring 100 points](https://en.wikipedia.org/wiki/Wilt_Chamberlain%27s_100-point_game) in a single game. Though somewhat shrouded in myth — no official second-by-second record exists, for this challenge, we've created a **plausible** per-second breakdown based on historical accounts and pacing estimates. By contrast, modern games have **accurate** event tracking down to the second — using NBA Play-by-Play logs and SportVU data. As such, being a Portland Native, we'll also provide Damian Lillard's 71 point games on February 26th, 2023 as a comparason. 

---
## 🏁 Challenge Format:
**Individual or Collaborative** 👤👥 Create a dynamic visualization that updates once per second, replaying the players' scoring race in real time.

---
### 📋 Requirements & Specifications:

- Create a **visualization** of the provided basketball scoring events.
- You may **render and animate** the visualization however you see fit.
- ⏱ **Game Time Mapping**:  
  - Map each **game minute** to **one real second**.  
  - (A 48-minute NBA game should be visualized over **48 real seconds**.)
- 📈 At each second:
  - Update and render the **cumulative points** scored up to that moment.
- 📉 Plotting Suggestion (optional but encouraged):
  - **X-axis**: Game time (0–48 seconds).
  - **Y-axis**: Total cumulative points.
- 🎥 Animate the visualization **live**:
  - Points should **visibly increase** over the course of 48 real seconds.
- 📜 Provided Data:
  - Wilt's scoring data (`wilt.json`).
  - Dame's scoring data (`dame.json`).

---

### 🎨 Examples:
- 📊 A real-time updating **graph** of points scored over time.
- 🎬 A **terminal animation** showing points ticking up.
- 🖼 A **static chart** displaying cumulative points at the end.
- 🎥 A **video recording** of your animation (optional).

## 🎯 Bonus Ideas

- 🌟 Add glowing dots or icons when a **big play** happens (like a 3-pointer).
- 🌟 Show both players' points on the same graph.
  - As a comparison, add the best game of the most average player in the game: Rudy Gobert's 35-point game (2017-03-22).
- 📺 Show live score labels next to each player's marker ("Wilt: 62 points", "Dame: 41 points").
- 🚀 Smoothly interpolate points for continuous movement instead of stepwise jumps.
- 📊 Create a mini-dashboard showing scoring pace (points per minute).
---

### 🔧 Example Visualization

Imagine:

- ⏳ A 48-second "race" where Wilt and Dame's scores rise over time
- 🎯 Wilt surges late, Dame explodes early, both chasing history
- 📈 Two colored lines sprinting up the graph in real time!

---

## 📂 Starter Files Provided:
- `wilt.json`
- `dame.json`
- `rudy.json`

---

## 🛠 Solutions Available:
[![Python](https://img.shields.io/badge/C-99-blue?logo=c)](solutions/python/matplotlib_ex)
[![Bash](https://img.shields.io/badge/Bash-4EAA25?logo=gnu-bash&logoColor=white)](solutions/bash)

---
# 🏁 Good Luck & 🔥🔥🔥RIP CITY BABY!!!🔥🔥🔥

