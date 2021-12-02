
set terminal png size 640,480

set title "Temps d execution"

set output "3-2_time.png"

plot "time.txt" u 1:2 w l t "duree usolve","time.txt" u 1:3 w l t "duree  lsolve", "time.txt" u 1:4 w l t "duree U\\b","time.txt" u 1:5 w l t "duree L\\b"

set logscale y

set output "3-2_time_log.png"

plot "time.txt" u 1:2 w l t "duree usolve","time.txt" u 1:3 w l t "duree  lsolve", "time.txt" u 1:4 w l t "duree U\\b","time.txt" u 1:5 w l t "duree L\\b"

set title "Erreur Avant et arrière"

set output "3-2_error_log.png"

plot "error.txt" u 1:2 w l t "erreur avant usolve","error.txt" u 1:3 w l t "erreur avant lsolve","error.txt" u 1:4 w l t "erreur avant U\\B","error.txt" u 1:5 w l t "erreur avant L\\B","error.txt" u 1:6 w l t "erreur arriere usolve","error.txt" u 1:7 w l t "erreur arriere lsolve","error.txt" u 1:8 w l t "erreur arriere U\\B","error.txt" u 1:9 w l t "erreur arriere L\\B"

unset logscale

set output "3-2_error.png"

plot "error.txt" u 1:2 w l t "erreur avant usolve","error.txt" u 1:3 w l t "erreur avant lsolve","error.txt" u 1:4 w l t "erreur avant U\\B","error.txt" u 1:5 w l t "erreur avant L\\B","error.txt" u 1:6 w l t "erreur arriere usolve","error.txt" u 1:7 w l t "erreur arriere lsolve","error.txt" u 1:8 w l t "erreur arriere U\\B","error.txt" u 1:9 w l t "erreur arriere L\\B"
