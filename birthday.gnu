#set terminal png
set terminal wxt size 350,262 enhanced font 'Verdana,10' persist
set yrange [0:1]
set xrange [1:2**128]
set logscale x
set format x "%1.0e"
set samples 80000
set xtics rotate
p32(x) = 1 - ((((2**32)-1)/(2**32))**(x*(x-1)/2))
p48(x) = 1 - ((((2**48)-1)/(2**48))**(x*(x-1)/2))

plot p32(x) title '32-bits', \
     p48(x) title '48-bits'

