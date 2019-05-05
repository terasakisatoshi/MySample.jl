using MySample
using Test
import Random


@testset "product-form" begin
    N=1000
    A = reshape(collect(1:1.0:N^2), N, N)
    B = reshape(collect(1:1.0:N^2), N, N)
    C = zeros(N, N)
    @time naiveform!(C, A, B)
    # copy result
    refC = copy(C)

    C = zeros(N, N)
    @time ipform!(C, A, B)
    @test C ≈ refC

    C = zeros(N, N)
    @time opform!(C, A, B)
    @test C ≈ refC

    C = zeros(N, N)
    @time mpform!(C, A, B)
    @test C ≈ refC
end


function preparedata(N::Int)
    A = Array{Float64}(undef, N,N)
    b = rand(N);
    c = rand(N);
    A, b, c
end


@testset "access array row/col direction" begin
    Random.seed!(1234);
    N = 50000
    A, b, c = preparedata(N)

    res_rows = @timed access_rows!(A, b, c)
    res_cols = @timed access_cols!(A, b, c)
    t1 = res_rows[2]
    t2 = res_cols[2]
    @show t1, t2
    @test t1 <= t2
end


@testset "unrolling" begin
    N = 1000
    A = reshape(convert.(Float64, collect(1:N^2)), N, N)
    B = reshape(convert.(Float64, collect(1:N^2)), N, N)
    C = zeros(N, N)
    @time refC = A * B
    C = zeros(N, N)
    @time unroll_naive!(C, A, B)
    C = zeros(N ,N)
    @time unroll_k!(C, A, B)
    @test C ≈ refC
    C = zeros(N, N)
    @time unroll_i!(C, A, B)
    @test C ≈ refC
    C = zeros(N, N)
    @time unroll_j!(C, A, B)
    @test C ≈ refC
    C = zeros(N, N)
    @time unroll_ij!(C, A, B)
    @test C ≈ refC
end