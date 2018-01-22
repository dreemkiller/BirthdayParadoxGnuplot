#set terminal png
set terminal wxt size 350,262 enhanced font 'Verdana,10' persist
set xrange [1000:2**128]
set yrange [0:1]
set logscale x
set format x "%1.0e"
set samples 10000
set xtics rotate
p32(x) = 1 - ((((2.0**32.0)-1)/(2.0**32.0))**(x*(x-1)/2.0))
#p48(x) = 1 - ((((2.0**48.0)-1)/(2.0**48.0))**(x*(x-1)/2.0))
p48(x) = 1 - exp(-x * (x-1) / (2 * 2**48))
#p64(x) = 1 - ((((2.0**64.0)-1)/(2.0**64.0))**(x*(x-1)/2.0))
p64(x) = 1.0 - exp(-x * (x-1.0) / (2.0 * 2.0**64))
p128(x) = 1.0 - exp(-x * (x-1.0) / (2.0 * 2.0**128))
print p64(2**32)
print p64(2**48)
print p64(2**30)
print p64(2**128)
print p64(2**64)

plot p32(x) title '32-bits', \
     p48(x) title '48-bits', \
     p64(x) title '64-bits', \
     p128(x) title '128-bits'

