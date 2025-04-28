# 🏀 Week [3] - Visualize Legendary Scoring Performances

## 📝 Challenge Overview
Bring the **greatest scoring performance** to life by visualizing how points were scored across an entire NBA game — second-by-second!

On March 2nd, 1962 Wilt Chamberlain set the [single-game scoring record by scoring 100 points](https://en.wikipedia.org/wiki/Wilt_Chamberlain%27s_100-point_game) in a single game. Though somewhat shrouded in myth — no official second-by-second record exists, for this challenge, we've created a **plausible** per-second breakdown based on historical accounts and pacing estimates. By contrast, modern games have **accurate** event tracking down to the second — using NBA Play-by-Play logs and SportVU data. As such, being a Portland Native, we'll also provide Damian Lillard's 71 point games on February 26th, 2023 as a comparason. 

You'll learn about **data transformation**, **dynamic rendering**, and **creative visualization** — skills used everywhere from sports analytics to real-time dashboards.

---
## 🏁 Challenge Format:
**Individual or Collaborative** 👤👥 Create a dynamic visualization that updates once per second, replaying the players' scoring race in real time.

---
### 📋 Requirements & Specifications:

- ⏱ Map each **game minute** to **one real second** (48 total seconds for a 48-minute NBA game)
- 📈 At each second:
  - Update and render the **cumulative** points scored up to that game minute
- 📉 Plot Wilt's points over time
  - X-axis: Game time (0–48 seconds)
  - Y-axis: Total points scored
- 🎥 Animate the visualization **live**: points should increase visibly over 48 real seconds
- 📜 Data provided:
  - **Wilt's hypothetical second-by-second** CSV
  - **Dame's real per-second breakdown** JSON (with 2PT, 3PT, and FT scores)

---

## 🎯 Bonus Ideas

- 🌟 Add glowing dots or icons when a big play happens (like a 3-pointer)
- 🌟 Show both players points on the same graph
-- as a comparason add the best game of the most average player in the game Rudy Gobert's 35 point game 2017-03-22
- 📺 Show live score labels next to each player's marker ("Wilt: 62 points", "Dame: 41 points")
- 🚀 Smooth interpolate points for continuous movement instead of stepwise jumps
- 📊 Create a mini-dashboard showing scoring pace (points/minute)

---

### 🔧 Example Visualization

Imagine:

- ⏳ A 48-second "race" where Wilt and Dame's scores rise over time
- 🎯 Wilt surges late, Dame explodes early, both chasing history
- 📈 Two colored lines sprinting up the graph in real time!

---

## 📂 Starter Files Provided:
- `wilt_chamberlain.csv`
- `damian_lillard.json`

---

## 🛠 Solutions Available:
| Language | Repo/Link |
|:---------|:----------|
| ![Python](https://img.shields.io/badge/Python-3.11-blue?logo=python) | [solutions/python](solutions/python) |
| ![React Frontend](https://img.shields.io/badge/React-18-blue?logo=react) | [solutions/react_frontend](solutions/react_frontend) |
| ![P5.js Animation](https://img.shields.io/badge/p5.js-1.4.0-red?logo=javascript) | [solutions/p5js](solutions/p5js) |

---
# 🏁 Good Luck & 🔥🔥🔥RIP CITY BABY!!!🔥🔥🔥

