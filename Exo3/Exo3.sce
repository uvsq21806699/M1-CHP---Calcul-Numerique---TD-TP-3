exec "gausskij3b.sci";

n = 5;

A = rand(n,n);
x = rand(n,1);

b = A*x;

disp(gausskij3b(A,b));
disp(A\b);

fd_time =mopen("time.txt", 'wt');
fd_error = mopen("error.txt", 'wt');

for n = 10:10:200
    A = rand(n,n);
    x = rand(n,1);

    b = A*x;

    tic()
    xg = gausskij3b(A,b);
    tg = toc();

    err_avg = norm(x-xg)/norm(x);
    err_arg = norm(b-A*xg)/(norm(A)*norm(xg));

    tic();
    xs = A\b;
    ts = toc();

    err_avs = norm(x-xs)/norm(x);
    err_ars = norm(b-A*xs)/(norm(A)*norm(xs));


    mfprintf(fd_time,"%i %f %f\n",n,tg,ts);
    mfprintf(fd_error,"%i %e %e %e %e\n",n,err_avg, err_arg, err_avs, err_ars);

end


disp("Done !\n")

mclose(fd_error);
mclose(fd_time);

