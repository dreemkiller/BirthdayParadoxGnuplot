#set terminal png
set terminal wxt size 350,262 enhanced font 'Verdana,10' persist
set xrange [1000:2**128]
set yrange [0:1]
set logscale x
set format x "%1.0e"
set samples 10000
set xtics rotate
p32(x) = 1 - exp(-x * (x-1) / (2 * 2**32))
p64(x) = 1.0 - exp(-x * (x-1.0) / (2.0 * 2.0**64))
p96(x) = 1.0 - exp(-x * (x-1.0) / (2.0 * 2.0**96))
p128(x) = 1.0 - exp(-x * (x-1.0) / (2.0 * 2.0**128))

plot p32(x) title '32-bits', \
     p64(x) title '64-bits', \
     p96(x) title '96-bits', \
     p128(x) title '128-bits'

