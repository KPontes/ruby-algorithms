module Primes
  
  def sieveprimes(n)
    n = n+1 # to fit n-esim element, as array initialize in zero
    arPrimes = Array.new(n, 1) #inicializa todos os indices como prime
    arPrimes[0] = 0
    arPrimes[1] = 0
    i = 2
    while (i * i) <= n do
      k = i
      while (k * i) <= n do
        arPrimes[k*i] = 0
        k+=1
      end
      i+=1
    end
    return arPrimes # se a[i]=1 então i = primo
  end

  def sieveprimes2(n)
    n = n+1 # to fit n-esim element, as array initialize in zero
    arPrimes = Array.new(n, 1) #inicializa todos os indices como prime
    arResult = []
    arPrimes[0] = 0
    arPrimes[1] = 0
    i = 2
    while (i * i) <= n do
      k = i
      while (k * i) <= n do
        arPrimes[k*i] = 0
        k+=1
      end
      i+=1
    end
    for i in 0..arPrimes.size-1
      if arPrimes[i] == 1 then  # se a[i]=1 então i = primo
        arResult.push(i)
      end
    end
    return arResult
  end

  def findallfactors(n) 
    # Obs. if a number is prime, factors will be only itself and one
    ar = []
    for i in 1..Math.sqrt(n)
      if (n%i) == 0 then
        ar.push(i)
        if !(i==Math.sqrt(n)) then
          ar.push(n/i)
        end
      end
    end
    return ar.sort
  end
  
  def gcd(a, b) 
    # Euclidean algorithm to find Geatest Commom Divisor (GCD)
    if a == 0 then
      return b 
    end
    # puts "a #{a}  b #{b}  (b%a) #{(b%a)}  "
    
    return gcd((b%a), a)  
  end
  
end