function access_rows!(A, b, c)
    row = size(A)[1]
    for i in 1:row
        A[i, 1] = b[i] * c[i]
    end
end

function access_cols!(A, b, c)
    col  = size(A)[2]
    for i in 1:col
        A[1, i] = b[i] * c[i]
    end
end