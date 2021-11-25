exec "usolve.sci"
exec "lsolve.sci"

n = 4

A = rand(n,n)
b = rand(n,1)

disp("usolve : ",usolve(triu(A),b))

disp("u\b : ",triu(A)\b)

disp("lsolve : ",lsolve(tril(A),b))

disp("l\b : ",tril(A)\b)
