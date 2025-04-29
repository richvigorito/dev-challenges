import matplotlib.pyplot as plt
import json

# Load your wilt
with open('../../../files/wilt.json') as f:
    wilt_data = json.load(f)

with open('../../../files/dame.json') as f:
    dame_data = json.load(f)

with open('../../../files/rudy.json') as f:
    rudy_data = json.load(f)


# Convert them to X (time) and Y (cumulative points)
def prepare_data(data):
    times = []
    scores = []
    total = 0
    for entry in data:
        for t, pts in entry.items():
            times.append(int(t))
            total += int(pts)
            scores.append(total)
    return times, scores

wilt_times, wilt_scores = prepare_data(wilt_data)
dame_times, dame_scores = prepare_data(dame_data)
rudy_times, rudy_scores = prepare_data(rudy_data)

# Plot both lines
plt.plot(wilt_times, wilt_scores, label="Wilt Chamberlain", color='purple')
plt.plot(dame_times, dame_scores, label="Damian Lillard", color='red')
plt.plot(rudy_times, rudy_scores, label="Rudy Gobert", color='green')

# Add labels, title, grid, legend
plt.xlabel("Seconds into game")
plt.ylabel("Total Points Scored")
plt.title("Wilt vs Dame vs Rudy Gobhhahaha- Points Over Time")
plt.legend()
plt.grid(True)

# Save the graph to a file
plt.savefig("graph.png")
