// file: vending.ts
class CheapCoffeeProvider {
  brew(ml: number): string {
    return `[cheap] ☕ ${ml}ml drip`;
  }
}

class PremiumCoffeeProvider {
  brew(ml: number): string {
    return `[premium] ☕ ${ml}ml single-origin`;
  }
}

class VendingMachine {
  private provider: CheapCoffeeProvider | PremiumCoffeeProvider;
  private brewing: boolean;

  constructor() {
    // High-level module depends on low-level concretion:
    this.provider = new CheapCoffeeProvider();
    this.brewing = false;
  }

  startBrew(ml: number, isVip: boolean): string {
    this.brewing = true;
    // Marketing wants hot-swap mid-brew… we hardcode it here 🤦
    if (isVip) {
      this.provider = new PremiumCoffeeProvider();
    }
    const cup = this.provider.brew(ml);
    this.brewing = false;
    return cup;
  }
}

// Demo
const vm = new VendingMachine();
console.log(vm.startBrew(200, false));
console.log(vm.startBrew(200, true));
