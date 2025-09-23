// file: vending.ts
//
interface CoffeeProvider {
  brew(ml: number): string;
}

class CheapCoffee implements CoffeeProvider {
  brew(ml: number): string {
    return `[cheap] ☕ ${ml}ml drip`;
  }
}

class PremiumCoffee implements CoffeeProvider {
  brew(ml: number): string {
    return `[premium] ☕ ${ml}ml single-origin`;
  }
}

class VendingMachine {
  private provider: CoffeeProvider;
  private brewing = false;

  constructor(provider: CoffeeProvider) {
    this.provider = provider;
  }

  startBrew(ml: number): string {
    this.brewing = true;
    const cup = this.provider.brew(ml);
    this.brewing = false;
    return cup;
  }

  setProvider(provider: CoffeeProvider) {
    this.provider = provider;
  }
}

// Demo
const vm = new VendingMachine(new CheapCoffee());
console.log(vm.startBrew(200));

vm.setProvider(new PremiumCoffee());
console.log(vm.startBrew(200));

