program trapz_integral
  implicit none
  integer, parameter :: dp = kind(1.0d0)
  integer, parameter :: long_int = selected_int_kind(18)  ! For large integers
  integer(kind=long_int) :: N, i
  real(dp) :: a, b, h, x, sum, integral
  real(dp) :: t1, t2

  a = 0.0_dp
  b = 100.0_dp
  N = 100000000_long_int  ! points
  h = (b - a) / real(N - 1, dp)
  sum = 0.0_dp

  call cpu_time(t1)

  do i = 1, N
    x = a + h * real(i - 1, dp)
    if (i == 1 .or. i == N) then
      sum = sum + f(x)
    else
      sum = sum + 2.0_dp * f(x)
    end if
  end do

  integral = h * sum / 2.0_dp

  call cpu_time(t2)

  print *, "Result of integral: ", integral
  print *, "Teme of execution: ", t2 - t1, " seconds"

  ! Export data of the function for plot 
  open(unit=10, file="function_data_F90.dat", status="replace")
  do i = 1, 1000
    x = 0.0_dp + (5.0_dp - 0.0_dp) * real(i - 1, dp) / 999.0_dp
    write(10,*) x, f(x)
  end do
  close(10)

contains

  real(dp) function f(x)
    real(dp), intent(in) :: x
    f = exp(-x) * cos(100.0_dp * x) * sqrt(x**3 + sin(x**2))
  end function f

end program trapz_integral
