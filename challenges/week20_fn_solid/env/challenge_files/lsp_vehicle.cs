// file: lsp_vehicle.cs
using System;

public abstract class Vehicle
{
    public virtual void StartEngine()
    {
        Console.WriteLine("Engine started.");
    }
}

public class Car : Vehicle
{
    public override void StartEngine()
    {
        Console.WriteLine("Car engine vroom!");
    }
}

public class HorseDrawnCarriage : Vehicle
{
    public override void StartEngine()
    {
        // LSP violation: subtype breaks the promise
        throw new NotSupportedException("Carriage has no engine!");
    }
}

public class Program
{
    static void TestStart(Vehicle v)
    {
        // Expectation: any Vehicle can be started
        v.StartEngine();
        Console.WriteLine("Off we go!");
    }

    public static void Main()
    {
        TestStart(new Car());
        try {
            TestStart(new HorseDrawnCarriage());
        } catch (Exception e){
            Console.WriteLine("to be expected since chariages dont have engines");
        }
    }
}

