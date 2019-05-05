"""
naive implementation
"""
function naiveform!(C, A, B)
    row, col  = size(C)
    colA = size(A)[2]
    for i in 1:row
        for j in 1:col
            for k in 1:colA
                C[i, j] = C[i, j] + A[i, k] * B[k, j]
            end
        end
    end
    C
end


"""
inner-product-form
"""
function ipform!(C, A, B)
    row, col  = size(C)
    colA = size(A)[2]
    for i in 1:row
        for j in 1:col
            dataC = 0.0
            for k in 1:colA
                dataC = dataC + A[i, k] * B[k, j]
            end
            C[i, j] = dataC
        end
    end
end


"""
outer-product-form
"""
function opform!(C, A, B)
    row, col  = size(C)
    colA = size(A)[2]
    for k in 1:colA
        for j in 1:col
            dataB = B[k, j]
            for i in 1:row
                C[i, j] = C[i, j] + A[i, k] * dataB
            end
        end
    end
end


"""
middle-product-form
"""
function mpform!(C, A, B)
    row, col  = size(C)
    colA = size(A)[2]
    for j in 1:col
        for k in 1:colA 
            dataB = B[k, j]
            for i in 1:row
                C[i, j] = C[i, j] + A[i, k] * dataB
            end
        end
    end
end
