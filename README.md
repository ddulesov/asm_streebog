# GOST R 34.11-2012 hash function with 512/256 bit digest

This is x86-64 assembler implementation of the GOST R 34.11-2012 hash function known as STREEBOG. 
The standard for this hash function developed by the Center for Information Protection and Special Communications of the Federal
Security Service of the Russian Federation with participation of the Open joint-stock company "Information Technologies and Communication
Systems" (InfoTeCS JSC).


## Build requirements

* AVX2 capable CPU
* GCC, Clang  compiler supporting 64-bit integers.
* GNU make (or any compatible make).


## Benchmark results
Intel i5-4210U CPU @ 1.70GHz
# https://github.com/adegtyarev/streebog   gost 34.11-2012 (512 bit) 
    Mbps calculated on 50000 hashes
```
      16 b      64 b     256 b    1024 b      8 kb     64 kb

      7.07     20.80     45.65     72.84     76.68     83.92
      6.97     20.95     49.66     58.94     83.22     82.29
      6.70     21.88     49.08     71.84     82.15     82.24
      6.76     21.19     45.51     67.81     85.23     82.49
      7.32     20.57     51.18     73.70     83.28     77.12
      6.89     21.83     46.29     70.16     78.55     74.31
      6.69     19.79     34.75     51.01     78.85     81.88
      7.36     22.09     49.59     66.07     70.54     80.93
      6.83     21.99     50.48     71.33     83.27     82.24
      6.91     22.24     51.36     73.84     84.86     81.66
```

# c + AVX2 gost 34.11-2012 (512 bit) 
    Mbps calculated on 50000 hashes
```
      16 b      64 b     256 b    1024 b      8 kb     64 kb

      7.05     22.27     48.13     73.99     85.29     83.95
      7.46     23.13     52.91     73.78     85.41     85.04
      4.83     16.88     42.25     62.38     86.66     82.10
      6.06     18.77     51.94     73.48     79.18     86.44
      7.50     23.16     53.04     74.43     75.26     84.67
      7.61     23.22     49.55     72.76     86.61     84.62
      7.07     22.71     48.99     73.94     86.53     84.69
      6.82     22.60     48.30     74.02     80.47     85.14
      7.39     22.62     49.39     76.53     76.51     85.17
      7.14     22.82     38.57     69.38     74.20     84.85
```
# assembler AVX2 34.11-2012 (512 bit)
    Mbps calculated on 50000 hashes
```
      16 b      64 b     256 b    1024 b      8 kb     64 kb

      7.42     22.26     59.88     70.02     95.23     99.91
      8.30     26.61     59.99     85.08     92.67     98.32
      8.50     21.90     57.34     88.00     94.44    101.52
      8.42     26.09     58.21     86.91    100.57     98.02
      8.27     26.62     61.62     85.38    101.63     98.36
      6.35     21.59     56.84     84.54     98.98     99.63
      8.42     25.47     60.44     81.78    100.36     97.11
      7.48     24.27     61.04     86.99     91.88     99.69
      8.65     25.99     61.35     86.54    101.39     99.96
      8.14     25.99     59.77     84.36    100.14     99.54
```