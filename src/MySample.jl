module MySample

export naiveform!, ipform!, opform!, mpform!
export unroll_naive!, unroll_i!, unroll_j!, unroll_k!, unroll_ij!
include("productform.jl")
include("unrolling.jl")

end # module
