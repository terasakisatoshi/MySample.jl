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