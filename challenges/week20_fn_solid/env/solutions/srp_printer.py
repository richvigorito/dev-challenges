# file: printer.py
import time
import random

# 1) Printing responsibility
class Printer:
    def print_label(self, shipment_id: str, weight_kg: float, driver_id: str):
        print(f"[LABEL] Driver {driver_id} — Shipment {shipment_id} – {weight_kg:.2f}kg")


# 2) Driver ALSO handles fuel tracking (violation)
class Driver:
    EFFICIENCY_THRESHOLD = 35

    def __init__(self, driver_id: str):
        self.id = driver_id
        self.total_fuel_logged = 0.0

    def estimate_driver_efficiency(self) -> float:
        random.seed(hash(self.id) ^ int(time.time()) >> 4)
        return 30.0 + random.random() * 10.0

    def is_efficient(self) -> bool:
        return self.estimate_driver_efficiency() > self.EFFICIENCY_THRESHOLD

    def log_fuel(self, gallons_used: float, miles_driven: float):
        if gallons_used <= 0:
            return
        mpg = miles_driven / gallons_used
        self.total_fuel_logged += gallons_used
        print(f"[FUEL] Driver {self.id} used {gallons_used:.2f} gal @ {mpg:.1f} mpg")


# 3) Social media
class Twitter:
    def __init__(self, token: str):
        self.twitter_token = token

    def tweet(self, msg: str):
        print(f"[TWEET] ({self.twitter_token[:6]}…): {msg}")


if __name__ == "__main__":
    driver_id = "DR-42"
    shipment_id = "SHP-1001"
    weight = 12.3
    gallons = 4.0
    miles = 160.0

    d = Driver(driver_id)
    p = Printer()
    t = Twitter("pass_by_value-dev-token")

    # Doing all the things here
    p.print_label(shipment_id, weight, driver_id)
    d.log_fuel(gallons, miles)

    if d.is_efficient():
        efficiency = d.estimate_driver_efficiency()
        t.tweet(f"Driver {driver_id} on 🔥 — {efficiency:.1f} mpg while shipping {shipment_id}!")
