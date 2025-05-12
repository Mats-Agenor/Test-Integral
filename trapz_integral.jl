using Pkg
using Printf

required_packages = ["Plots", "LaTeXStrings"]

for pkg in required_packages
    try
        eval(Meta.parse("using $pkg"))
    catch e
        println("Pkg $pkg no enconter. Instaling...")
        Pkg.add(pkg)
        eval(Meta.parse("using $pkg"))
    end
end

# Função a ser integrada (otimizada)
function f(x::Float64)::Float64
    return exp(-x) * cos(100 * x) * sqrt(x^3 + sin(x^2))
end


function f_vectorized(x::AbstractArray)::Vector{Float64}
    return exp.(-x) .* cos.(100 .* x) .* sqrt.(x.^3 .+ sin.(x.^2))
end


function calcular_integral()
    a, b = 0.0, 100.0
    N = 10^8
    
    # Alocação e cálculo
    x = range(a, stop=b, length=N)
    h = (b - a) / (N - 1)
    
    
    tempo_calculo = @elapsed begin
        fx = f_vectorized(x)
        integral = (first(fx) + last(fx) + 2 * sum(@view fx[2:end-1])) * h / 2
    end
    
    return integral, tempo_calculo
end

# Execution and output 
println("Calculin integral (N = 10^8 points)...")
resultado, tempo = calcular_integral()

@printf("\nResult of integral: %.8f\n", resultado)
@printf("Teme of execution: %.4f segundos\n", tempo)
@printf("Performance: %.1f milion de points/sec\n", 100/tempo)

# Plot 
x_plot = range(0, 5, length=1000)
y_plot = f_vectorized(x_plot)

plt = plot(x_plot, y_plot,
           label=L"f(x) = e^{-x} \cos(100x) \sqrt{x^3 + \sin(x^2)}",
           linewidth=2,
           palette=:tab10,
           xlabel=L"x",
           ylabel=L"f(x)",
           title=@sprintf("Integral = %.5f (tempo: %.2fs)", resultado, tempo),
           grid=true,
           legend=:topright,
           size=(800, 400),
           dpi=300)

savefig(plt, "function.png")
display(plt)
