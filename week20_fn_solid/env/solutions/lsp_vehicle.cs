// file: vehicle.cs
using System;

// A contract: any startable vehicle can start
public interface IStartable
{
    void Start();
}

// Base vehicle abstraction — no false promises
public abstract class Vehicle
{
    public virtual void TurnWheel(string direction)
    {
        Console.WriteLine($"Turning wheels {direction}");
    }
}

// Car has an engine, so it can start
public class Car : Vehicle, IStartable
{
    public void Start()
    {
        Console.WriteLine("Car engine vroom!");
    }
}

// Horse carriage doesn't have an engine, but still starts
public class HorseDrawnCarriage : Vehicle, IStartable
{
    public void Start()
    {
        Console.WriteLine("🐎 Encouraging the horse…");
    }
}

public class Program
{
    // Only takes things that truly can start
    static void TestStart(IStartable startable, Vehicle v)
    {
        startable.Start();
        v.TurnWheel("left");
        Console.WriteLine("Off we go!");
    }

    public static void Main()
    {
        var car = new Car();
        var carriage = new HorseDrawnCarriage();

        TestStart(car, car);
        TestStart(carriage, carriage);
    }
}
