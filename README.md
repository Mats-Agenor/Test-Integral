# Trapezoidal Integral Test
-------------
In Fortran
compile with gfortran -O3 trapz_integral.f90 -o trapz_integral
execute with ./trapz_integral

In C++
compile with g++ -O3 trapz_integral.cpp -o trapz_integral
execute with ./trapezoidal_integration

In Python
python3 trapz_integral.py

In Julia
julia trapz_integral.jl

------------
This little game is an integration test to compare different programming languages, C++, Fotran, Python and Julia, as it is, Fortran has the best efficiency, solving in less than 10 seconds on my i3 10th gen with 12 ram.

Interesting tests are found with N = 1e9 points:
As it stands:
Fortran ~33.8 s
C++ ~39.4 s
Julia ~75 s (when not Dead)
Python = Dead

This small activity is useful for testing performance and optimization of clusters and supercomputers.
