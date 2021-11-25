function [x] = gausskij3b(A,b)

n = size(b, 1)

for k = 1 : n - 1
    for i = k+1 : n
        m = A(i,k) / A(k,k);
        b(i) = b(i) - m * b(k);
        for j = k+1 : n
            A(i,j) = A(i,j) - m * A(k,j);
        end
    end
end
endfunction
