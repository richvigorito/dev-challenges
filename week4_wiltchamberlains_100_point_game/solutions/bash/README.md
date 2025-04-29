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
### 🎥 Output
![Watch the simulation](simulation.gif)

... i know what you're thinking; minds blown! 

---

# 📌 Notes

- The Bash script uses `jq` to read events and `tput` to update the terminal output without creating new lines.
- `sleep` is used to control the speed of the simulation.
- Make sure you have the `files/` folder structured correctly next to `simulate.sh`.

