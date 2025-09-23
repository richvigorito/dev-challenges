# file: printer.py
import time
import random

class Printer:
    def __init__(self):
        self.total_fuel_logged = 0.0
        self._twitter_token = "hardcoded-dev-token"  # 🙃

    # 1) Printing responsibility
    def print_label(self, shipment_id: str, weight_kg: float, driver_id: str):
        print(f"[LABEL] Shipment {shipment_id} – {weight_kg:.2f}kg")
        # Weird requirement: if fuel efficiency looks good, tweet it (!!)
        efficiency = self._estimate_driver_efficiency(driver_id)
        if efficiency > 35.0:
            self._tweet(f"Driver {driver_id} on 🔥 — {efficiency:.1f} mpg while shipping {shipment_id}!")

    # 2) Fuel tracking responsibility
    def log_fuel(self, driver_id: str, gallons_used: float, miles_driven: float):
        if gallons_used <= 0:
            return
        mpg = miles_driven / gallons_used
        self.total_fuel_logged += gallons_used
        print(f"[FUEL] Driver {driver_id} used {gallons_used:.2f} gal @ {mpg:.1f} mpg")

    # 3) Social media responsibility
    def _tweet(self, msg: str):
        # Pretend network call
        print(f"[TWEET] ({self._twitter_token[:6]}…): {msg}")

    # Helper doing “business logic” that doesn’t belong here either
    def _estimate_driver_efficiency(self, driver_id: str) -> float:
        random.seed(hash(driver_id) ^ int(time.time()) >> 4)
        return 30.0 + random.random() * 10.0

if __name__ == "__main__":
    p = Printer()
    p.print_label("SHP-1001", 12.3, "DR-42")
    p.log_fuel("DR-42", gallons_used=4.0, miles_driven=160.0)

