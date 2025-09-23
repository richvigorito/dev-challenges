// file: isp_robot.java
interface CanHammer {
    void hammerBoard();
}

interface CanPaint {
    void paintFence();
}

interface CanInvoice {
    void sendInvoice();
}


class ContractorBot implements CanHammer, CanPaint, CanInvoice {
    public void hammerBoard() { System.out.println(" 🔨 Seen 'em out at Soco, they're pounding sixteen penny nails"); }
    public void paintFence() { System.out.println("🎨 Painting fence white."); }
    public void sendInvoice() { System.out.println("📃 Honest pay for an honest days work"); }
}

class FinanceBot implements CanInvoice {
    public void sendInvoice() { System.out.println("📃 Moves numbers around on a computer; collects money."); }
}

public class isp_robot {
    public static void main(String[] args) {
        CanHammer framer = new ContractorBot();
        framer.hammerBoard();

        CanPaint paintBot = new ContractorBot();
        paintBot.paintFence();

        CanInvoice admin = new ContractorBot();
        admin.sendInvoice();

        CanInvoice accountant = new FinanceBot();
        accountant.sendInvoice();
    }
}

