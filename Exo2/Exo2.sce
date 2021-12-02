exec "usolve.sci"
exec "lsolve.sci"

n = 4;

A = rand(n,n);
xi = rand(n,1);

U = triu(A);
L = tril(A);

bu = U * xi
bl = L * xi

tic();
xu = usolve(U,bu);
tu  = toc();
disp("usolve : ",xu);
tic();
xus = U\bu;
tus = toc();
disp("u\b : ",xus);

tic();
xl = lsolve(L,bl);
tl = toc();
disp("lsolve : ",xl)

tic();
xls = L\bl;
tls = toc();
disp("l\b : ",xls);

fd_time =mopen("time.txt", 'wt');
fd_error = mopen("error.txt", 'wt');

mfprintf(fd_time,"#n tu tl tus tls\n");
mfprintf(fd_error,"#n err_avu err_avl err_avus err_avls err_aru err_arl err_arus err_arls\n");

for n = 10:10:100

    //n = 4;

    A = rand(n,n);
    xi = rand(n,1);
    
    U = triu(A);
    L = tril(A);

    bu = U * xi
    bl = L * xi
    
    tic();
    xu = usolve(U,bu);
    tu  = toc();
    tic();
    xus = U\bu;
    tus = toc();
    
    err_avu = norm(xi-xu)/norm(xi);
    err_aru = norm(bu-U*xu)/ (norm(U)*norm(xu));

    err_avus = norm(xi-xus)/norm(xi);
    err_arus = norm(bu-U*xus)/ (norm(U)*norm(xus));

    //mprintf("\nErreur upper -- av: %e -- ar: %e\n",err_avu, err_aru);

    tic();
    xl = lsolve(L,bl);
    tl = toc();

    tic();
    xls = L\bl;
    tls = toc();
    
    err_avl = norm(xi-xl)/norm(xi);
    err_arl = norm(bl-L*xl)/ (norm(L)*norm(xl));
    
    err_avls = norm(xi-xls)/norm(xi);
    err_arls = norm(bl-L*xls)/ (norm(L)*norm(xls));
    
    //mprintf("\nErreur -- av: %e -- avs: %e -- ar: %e -- ars: %e\n",err_avl,err_avls,err_arl,err_arls);
    
    mfprintf(fd_time,"%i %f %f %f %f\n",n, tu, tl, tus, tls);
    mfprintf(fd_error,"%i %e %e %e %e %e %e %e %e\n",n, err_avu, err_avl, err_avus, err_avls, err_aru, err_arl, err_arus, err_arls);
    
    
end
  
disp("Done !")

mclose(fd_time);
mclose(fd_error);






