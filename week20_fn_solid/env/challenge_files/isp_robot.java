// file: robot.java
interface SuperRobot {
    void hammerBoard();
    void paintFence();
    void sendInvoice();
}

class ContractorBot implements SuperRobot {
    public void hammerBoard() { System.out.println(" 🔨 Seen 'em out at Soco, they're pounding sixteen penny nails"); }
    public void paintFence() { System.out.println("🎨 Painting fence white."); }
    public void sendInvoice() { System.out.println("📃 Honest pay for an honest days work"); }
}

class FinanceBot implements SuperRobot {
    public void hammerBoard() { throw new UnsupportedOperationException("Finance only"); }
    public void paintFence() { throw new UnsupportedOperationException("Finance only"); }
    public void sendInvoice() { System.out.println("📃 Moves numbers around on a computer; collects money."); }
}

public class isp_robot {
    public static void main(String[] args) {
        SuperRobot r1 = new ContractorBot();
        r1.hammerBoard();
        r1.paintFence();
        r1.sendInvoice();

        SuperRobot r2 = new FinanceBot();
        r2.sendInvoice();
        // r2.hammerBoard(); // would cause exception
    }
}
