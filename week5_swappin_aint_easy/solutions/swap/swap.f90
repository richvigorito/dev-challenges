! Fortran
! swap.f90
program swap_example
  implicit none
  integer :: a, b, temp
  a = 1
  b = 2
  print *, "Before: a=", a, " b=", b
  temp = a
  a = b
  b = temp
  print *, "After: a=", a, " b=", b
end program swap_example


