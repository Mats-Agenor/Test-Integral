#include <iostream>
#include <cmath>
#include <fstream>
#include <chrono>

using namespace std;
using namespace std::chrono;

// Function to integrate
double f(double x) {
    return exp(-x) * cos(100.0 * x) * sqrt(x*x*x + sin(x*x));
}

int main() {
    double a = 0.0;
    double b = 100.0;
    long N = 100000000L;  // points
    double h = (b - a) / (N - 1);
    double sum = 0.0;

    // Start timer
    auto start = high_resolution_clock::now();

    // Trapezoidal integration
    for (long i = 0; i < N; i++) {
        double x = a + h * i;
        if (i == 0 || i == N-1) {
            sum += f(x);
        } else {
            sum += 2.0 * f(x);
        }
    }

    double integral = h * sum / 2.0;

    // Stop timer
    auto stop = high_resolution_clock::now();
    auto duration = duration_cast<microseconds>(stop - start);

    // Output results
    cout.precision(15);
    cout << "Integration result: " << integral << endl;
    cout << "Execution time: " << duration.count() / 1e6 << " seconds" << endl;

    // Export function data for plotting (between 0 and 5)
    ofstream outfile("function_data_cpp.dat");
    for (int i = 0; i < 1000; i++) {
        double x = 0.0 + (5.0 - 0.0) * i / 999.0;
        outfile << x << " " << f(x) << endl;
    }
    outfile.close();

    return 0;
}
