# Wilt Chamberlain 100-Point Game Simulation (Bash Version)

This script simulates Wilt Chamberlain's historic 100-point game live in the terminal using Bash.

## 📂 Files Needed

- `simulate.sh` — the Bash script
- `../../files/wilt.json` — Wilt Chamberlain scoring events
- `../../files/dame.json` — Damian Lillard scoring events
- `simulation.webm` — (optional) short video of the simulation

## ⚙️ Requirements

- Bash (Linux, MacOS)
- `jq` installed for JSON parsing

### Install `jq` if needed:

```bash
# MacOS
brew install jq

# Ubuntu/Debian
sudo apt install jq
```

## ▶️ How to Run

```bash
bash simulate.sh
```

The simulation will play in your terminal, showing the running scores:

```
Wilt: 24   Dame: 16   Other: 0
Wilt: 26   Dame: 18   Other: 0
Wilt: 30   Dame: 20   Other: 0
```

## 🎥 Bonus: Watch a Simulation Video

A pre-recorded version is available: `simulation.webm`.

You can open it with any video player (e.g., VLC) or embed it in a webpage:

```html
<video controls width="600">
  <source src="simulation.webm" type="video/webm">
  Your browser does not support the video tag.
</video>
```

---

# 📌 Notes

- The Bash script uses `jq` to read events and `tput` to update the terminal output without creating new lines.
- `sleep` is used to control the speed of the simulation.
- Make sure you have the `files/` folder structured correctly next to `simulate.sh`.

