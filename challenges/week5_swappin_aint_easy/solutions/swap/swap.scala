// Scala
// Object-Oriented Swap using mutable variables and temp
object SwapOOP {
  def swapTemp(a: Int, b: Int): (Int, Int) = {
    var x = a
    var y = b
    val temp = x
    x = y
    y = temp
    (x, y)
  }
}

// Functional Style Swap using tuple destructuring
object SwapFunctional {
  def swap(a: Int, b: Int): (Int, Int) = (b, a)
}

// Runner
object Main extends App {
  println("Scala OOP Swap (5, 3): " + SwapOOP.swapTemp(5, 3))
  println("Scala Functional Swap (3, 4): " + SwapFunctional.swap(3, 4))
}
