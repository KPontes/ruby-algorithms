require 'primes'

module CodilityMaxsliceHelper
  include Primes
  #MAXSLICE

  def maxprofit(a)
    if a.size == 0 then return 0 end
    _maxprofit = Array[]

    for i in 0..a.size-1
      _min = a[0..i].min
      _indexmin = a[0..i].index(_min)
      _max = a[_indexmin..i].max
      (_max - _min) > 0 ? _maxprofit[i] = (_max - _min) : _maxprofit[i] = 0
    end

    return _maxprofit.max
  end
  
  def maxprofit2(a)
    if a.size <= 1 then return 0 end
    aMaxprofit = Array.new(a.size,0)
    min = a[0]; max = a[0]
    iMin = 0; iMax = 0
    for i in 1..a.size-1
      if a[i] < min then
        min = a[i]
        iMin = i
      end
      if a[i] > max then
        max = a[i]
        iMax = i
      end
      if iMin > iMax then # reposition max when find a new min to the right of array
        max = min
        iMax = iMin
      else
        (max - min) > 0 ? aMaxprofit[i] = (max - min) : aMaxprofit[i] = 0
      end
    end

    return aMaxprofit.max
  end
  
  def maxslicesum(a) #100%

    if a.size == 0 then 
      return 0 
    end
    aMaxEnding = Array.new(a.size,0)
    for i in 0..a.size-1
      if i == 0 then
        aMaxEnding[i] = a[i]
      else
        # max antre a[i] e a soma de a[i] com seu anterior ou com o max do endereço anterior
        aMaxEnding[i] = [a[i], (aMaxEnding[i-1]+a[i]), (a[i-1]+a[i])].max
      end
    end

    return aMaxEnding.max
  end
  
  def maxslicesum2(a) #100%

    if a.size == 0 then 
      return 0 
    end
    if a.size == 1 then 
      return a[0]
    end
    maxPosition = a[0] 
    maxSlice = a[0]
    for i in 1..a.size-1
      # max antre a[i] e a soma de a[i] com seu anterior ou com o max do endereço anterior
      maxPosition = [a[i], maxPosition + a[i]].max
      maxSlice = [maxSlice, maxPosition].max
    end
    return maxSlice
  end
  
  def maxdoubleslicesum(a) #100% correct
    def maxslicesum(a) 
      aMaxEnding = Array.new(a.size,0)
      for i in 0..a.size-1
        if i == 0 then
          aMaxEnding[i] = a[i]
        else
          # max antre a[i] e a soma de a[i] com seu anterior ou com o max do endereço anterior
          aMaxEnding[i] = [a[i], (aMaxEnding[i-1]+a[i]), (a[i-1]+a[i])].max
        end
      end
      return aMaxEnding
    end
    
    # this solution is based on considering that, according to question statement, the extremities will never be counted on maxslice.
    # compute maxSlice, find the begin and end of maxslice array, and subtract the minimum element, that is the candidate to middle
    n = a.size
    if n <= 3 then 
      return 0 
    end
    aWithoutBorder = a[1..n-2] # extract extremities as they cant be on the computed sum
    aMaxSlice = maxslicesum(aWithoutBorder)
    max = aMaxSlice.max
    iEnd = aMaxSlice.index(max) # end of Maxslice
    sum = 0
    for i in iEnd.downto(0)
      if sum != max then
        sum+=aWithoutBorder[i]
        iStart = i
        if sum == max then
          break
        end
      end
    end
    # min value is the candidate to be the middle position to divide the array in two slices
    min = aWithoutBorder[iStart..iEnd].min
    iMid = aWithoutBorder.index(min)

    result = max
    if iEnd-iMid >= 2 then # at least one element in between
      result = max-min
    end

    return result
  end
  
  #PRIME
  def minperimeterrectangle(n)
    _limit = (Math.sqrt(n)).floor
    _perimeter = Array[]
    _ind = 0
    for i in 1.._limit
      if (n % i) == 0 then
        a = i
        b = n/i
        _perimeter[_ind] = (a+b)*2
        _ind+=1
      end
    end
    return _perimeter.min
  end

  def countfactors(n)
    _limit = (Math.sqrt(n)).floor
    _factors = Array[]
    _ind = 0

    for i in 1.._limit
      if (n % i) == 0 then
        a = i
        b = n/i
        _factors[_ind] = a
        _factors[_ind+1] = b
        _ind+=2
      end
    end
    return (_factors.uniq).size
  end  
  
  def flags(a)

    _flag = Array.new
    if a.size < 3 then
      return 0 # não tem como haver picos
    end    
    j = 0
    # find flags
    for i in 1..a.size-2
      if (a[i] > a[i-1]) && (a[i] > a[i+1]) then
        _flag[j] = i #insere indice da flag
        j+=1 
      end
    end

    if _flag.size < 2 then
      return 0 # não tem como haver mais de 1 pico
    end
    _maxcount = 0
    # try max flags possible for each n
    n = (Math.sqrt(a.size)).floor

    while n >= 2 do # numero maximo de bandeiras trazidas
      _count = 1
      _ianterior = 0

      for i in 1.._flag.size-1
        if ((_flag[i] - _flag[_ianterior]) >= n) then 
          _count+=1
          _ianterior = i
          if _count == n then  break end
        end
      end
      if _count > _maxcount then _maxcount = _count end
      n-=1
      if _maxcount >= n then break  end #as n is the maximum flags for that round, exit if maxcount is already bigger
    end
    return _maxcount
  end
  
  # SIEVE OF ERATOSTHENES
  
  def countsemiprimes2(n, p, q)
    #treat minimal array
    arResult = Array[]
    if n == 1 then 
      for i in 0..p.size-1
        arResult[i] = 0
      end
      return arResult
    end
    # build Primes
    arPrimes = []
    arTemp = sieveprimes(n)
    for i in 0..arTemp.size-1
      if arTemp[i] == 1 then
        arPrimes.push(i)
      end
    end

    # build semiPrimes. Loops = (Math.sqrt(n)).floor
    arSemiprime = Array[]
    i = 0; j = 0
    while (arPrimes[i]*arPrimes[i] <= n) do
      while (arPrimes[i]*arPrimes[j] <= n) do
        arSemiprime.push(arPrimes[i] * arPrimes[j])
        j+=1
      end
      i+=1
      j=i
    end
    arSemiprime.sort!
    
    # apply range de P e Q nos semiPrimes
    for i in 0..p.size-1
      arResult[i] = arSemiprime.count { |num| (num>=p[i] && num <=q[i])  } 
    end
    return arResult    
  end  
  
  def countnondivisible(a) 
    # setup divisors of a[i]
    hDivisors = Hash.new
    for i in 0..a.size-1
      j = 1
      _lim = (a[i]/2).floor
      # trata 1 em separado
      if a[i] == 1 then hDivisors[a[i]] = [1] end

      while j <= _lim
        if hDivisors[a[i]] == nil then
          hDivisors[a[i]] = [j]
        else
          if j == 1 then #elemento repetido em a
            break
          end
          if a[i]%j == 0 then
            hDivisors[a[i]].push(j)
          end
        end
        j+=1
      end
      if j != 1 then
        hDivisors[a[i]].push(a[i])
      end
    end

    _result = Array[]
    _tmp = Array[]
    for i in 0..a.size-1
      _tmp[i] = (hDivisors[a[i]] & a) # intersection to find divisors contained in A
      _tmp[i] = a - _tmp[i] # non divisors are A elements not contained in _Temp
      _result[i] = _tmp[i].size
    end

    return _result
    
  end
  
  def countnondivisible2(a) 
    n = a.size
    # setup divisors of a[i]
    hDivisors = Hash.new
    aResult = Array[]
    for i in 0..n-1
      if hDivisors[a[i]] == nil then
        hDivisors[a[i]] = findallfactors(a[i])
        hDivisors[a[i]] = (a - hDivisors[a[i]]) # leave only NONDivisors of each element of A
      end
      aResult[i] = hDivisors[a[i]].size
    end

    return aResult
    
  end  
  
  #EUCLIDES

  def chocolatesbynumbers(n, m)
    armmc = Array[]
    if (m % n) == 0 then
      armmc[0] = m
    else
      armmc[0] = 0
      while (true) do
        x = (armmc[armmc.size-1] + m) 
        if (x % n) != 0 then
          armmc.push(x % n)
        else
          break
        end
      end
    end
    return armmc.size
  end

  
  def chocolatesbynumbersRecursive(n, m)  
    def mmc(a, b, armmc)
      x = (armmc[armmc.size-1] + b) 

      if (x % a) != 0 then
        armmc.push(x % a)
        return mmc(a, b, armmc)
      end
    end
    
    armmc = Array[]
    if (n % m) == 0 then
      armmc[0] = m
    else
      armmc[0] = 0
      mmc(n, m, armmc)
    end
    return armmc.size 
  end
  
  def commonprimedivisors(a, b, z)
    
    def primes(n)
      # sieve primes
      if n<2 then n=2 end
      arN = Array(2..n)
      arComposite = [0]
      i = 0
      while (arN[i]*arN[i]) <= n do
        k = i
        while (arN[i]*arN[k]) <= n do
          _composite = arN[i]*arN[k]
          arComposite.push(_composite)
          k+=1
        end
        i+=1
      end
      return (arN-arComposite)
    end
    
    samePrimeDiv = 0
    # verifica numero de primedivisors para cada par k dos arrays de entrada a e b
    _max = [a.max,b.max].max
    arPrimes = primes(_max)
    # p arPrimes
    for k in 0..a.size-1
      # (a[k] > b[k]) ? (arPrimes = arPrimesA) : (arPrimes = arPrimesB)
      primedivA = []
      primedivB = []
      i = 0
      _maxab = 1+([a[k], b[k]].max)/2
      while arPrimes[i] < _maxab do
        if ((a[k] % arPrimes[i]) == 0) then
          primedivA.push(arPrimes[i])
        end
        if ((b[k] % arPrimes[i]) == 0) then 
          primedivB.push(arPrimes[i])
        end
        i+=1
      end
      # insert a[k] if it is prime and is missing in primedivisorsA
      if (arPrimes.include?(a[k])) && !(primedivA.include?(a[k])) then
        primedivA.push(a[k])
      end
      if (arPrimes.include?(b[k])) && !(primedivB.include?(b[k])) then
        primedivB.push(b[k])
      end

      if primedivA == primedivB then
        samePrimeDiv+= 1
      end
    end
    return samePrimeDiv
    
  end
  
  def commonprimedivisors2(a, b)
    
    samePrimeDiv = 0
    # verifica numero de primedivisors para cada par k dos arrays de entrada a e b
    max = [a.max,b.max].max
    arPrimes = [1] + sieveprimes2(max)

    primedivA = []
    primedivB = []

    for k in 0..a.size-1
      aFactors = findallfactors(a[k])
      primedivA = aFactors & arPrimes # intersection between all factors and the ones that are primes
      
      aFactors = findallfactors(b[k])
      primedivB = aFactors & arPrimes # intersection between all factors and the ones that are primes

      if (primedivA == primedivB) then
        samePrimeDiv+= 1
      end
    end

    return samePrimeDiv
    
  end
  
end



