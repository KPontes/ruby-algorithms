module CodilityHelper
  def binary_gap(n)
    # write your code in Ruby 2.2
    byte = n.to_s(2)
    start = false
    sequencia = 0
    bgap = 0
    for i in 0..byte.length-1
      if byte[i] == "1" then
        start = true
        if sequencia > bgap then
          bgap = sequencia
        end
        sequencia = 0
      end
      if (byte[i] == "0") && (start) then
        sequencia +=1
      end    
    end
    return bgap
  end
  
  def cyclic_rotation(a, k)
    r = Array.new(a.size)
    if a.size <= k then 
      r = a
      return r
    end
    for i in (0..a.size-1) do
      if (i+k <= a.size-1) then
        r[i+k] = a[i]
      end
      if (i < k) then
        r[i] = a[a.size-k+i]
      end
    end
    return r
  end
  
  def cyclic_rotation2(a, k)
    # r = a[a.size-k,k] + a[0,a.size-k]
    for i in 1..k
      a.rotate!(-1)
    end

    return a
  end
  
  def odd_ocurrences_in_array(a)
    a.sort!
    i = a.size-1
    if i == 1 then
      return a[i]
    end
    while !a.empty? do
      if a[i] == a[i-1] then
        a.pop
        a.pop
        i-=2
      else
        return a[i]
      end
    end
  end
 
  def odd_ocurrences_in_array2(a) # 100%
    hKeys = Hash.new
    i = 0
    if a.size-1 == 1 then
      return a[i]
    end
    while i <= a.size-1 do
      if hKeys[a[i]] == nil then
        hKeys[a[i]] = 1
      else
        hKeys[a[i]]+=1
      end
      i+=1
    end
    hKeys.each { |key, value| 
      if (value % 2) != 0 then
        return key
      end
    }
  end
 
  def perm_missing_element(a)
    a.sort!
    i = 0
    while i <= a.size-1 do
      if a[i] != i+1 then
        return i+1
      else
         i+=1
      end
    end
    return i+1
  end 
  
  def perm_missing_element2(a)
    artemp = Array.new(a.size) {|i| i+1}
    hKeys = Hash[artemp.each_with_object(0).to_a]
    i = 0
    while i <= a.size-1 do
      hKeys[a[i]] = 1
      i+=1
    end
    return hKeys.key(0)
  end
  
  def frog_jump(x, y, d)
    if (y-x)%d == 0 then
      return (y-x)/d
    else
      return 1+(y-x)/d
    end
  end
  
  def tape_equilibrium(a)
    _sum = 0
    a.each { |a1| _sum+=a1 }
    acum = 0; lowerpart = _sum.abs; _first = false
    for i in 0..a.size-2
      acum += a[i]
      dif = _sum-acum
      if ((acum-dif).abs <= lowerpart.abs) then
        lowerpart = (acum-dif).abs
        _first = true
      else
        if ((acum-dif) < 0) and !(_first) then
          lowerpart = (acum-dif).abs
        end
      end
    end
    return lowerpart
  end
  
  def tape_equilibrium2(a)
    totalSum = 0
    a.each { |a1| totalSum+=a1 }
    acumLeft = 0;
    minPartition = Float::INFINITY
    for i in 1..a.size-1
      acumLeft += a[i-1]
      acumRight = totalSum - acumLeft
      diff = (acumLeft - acumRight).abs
      #puts "acumLeft: #{acumLeft} acumRight: #{acumRight} diff: #{diff} "
      if (diff <= minPartition) then
        minPartition = diff
      end
    end
    return minPartition
  end
  
  def missingInteger2(a)
    artemp = Array.new(a.size+1) {|i| i+1}
    hOccurences = Hash[artemp.each_with_object(nil).to_a]
    i = 0
    while i <= a.size-1 do
      if (hOccurences[a[i]] == nil) and (a[i] > 0) then
        hOccurences[a[i]] = i
      end
      i+=1
    end
    # p hOccurences
    return hOccurences.key(nil)  
  end
  

  def permCheck(a)
    a.sort!
    i=0; permCheck = 1
    n = a.size
    while i < n do
      if (a[i] != i+1) then
        permCheck = 0
        break
      end
      i+=1
    end
    return permCheck
  end
  
  def frogRiverOne(x, a)
    b = Array.new(x, 0)
    i = 0
    while i < a.size do
      _val = a[i]
      if b[_val-1] == 0 then
        b[_val-1] = i+1
      end
      i+=1
    end

    b.sort!
    if b.include?0 then return -1 end

    return b[b.size-1]-1
  end
  
  def frogRiverOne2(x, a)
    artemp = Array.new(x) {|i| i+1}
    # Key holds positions 1 to X; Value holds the first second when the leaf fell into that position
    hLeafs = Hash[artemp.each_with_object(-1).to_a]
    i = 0
    while i <= a.size-1 do
      if hLeafs[a[i]] == -1 then
        hLeafs[a[i]] = i # set the time when the leaf fell
      end
      i+=1
    end
    # p hLeafs
    if hLeafs.has_value?(-1) then return -1 end
    return hLeafs.values.max
  end  


  def maxCounter2(n, a)
    artemp = Array.new(n) {|i| i+1}
    hCounters = Hash[artemp.each_with_object(0).to_a]    
    maxCounter = 0
    for i in 0..a.size-1
      if a[i] <= n then
        hCounters[a[i]] = hCounters[a[i]] + 1 
        if hCounters[a[i]] > maxCounter then
          maxCounter = hCounters[a[i]]
        end
      else
        hCounters.each { |key, value| hCounters[key] = maxCounter }
      end
    end
    return hCounters.values
  end

  def maxCounter(n, a)
    _counters = Array.new(n, 0)
    _max = 0
    for i in 0..a.size-1
      if a[i] <= n then
        _counters[a[i]-1] += 1
        if _counters[a[i]-1] > _max then
          _max = _counters[a[i]-1]
        end
      else
        n.times do |num|
          _counters[num] = _max
        end
      end
    end
    #puts _counters
    return _counters
  end

  def countDiv2(a, b, k)
    _result = 0
    case
      when k < a
        _result = (b-a)/k
        if ((a%k == 0) || (b%k == 0)) then
          _result +=1
        end
  
      when k.between?(a, b)
        _result = 1 + (b-a)/k
  
      when ((k > b) and (a == 0))
        _result = 1
    end

    return _result
  end

  def passingCars(a, n)
    _result = Array.new
    _east = Array.new
    for i in 0..a.size-1
      if a[i] == 0 then
        _east.push(i)
      else
        _west = i
        for j in 0.._east.size-1
          _result.push([_east[j],_west])
        end
      end
    end
    #puts "resultado: #{ _result}"
    return _result.count
  end
  
  def genomicRangeQuery(s, p, q)
    
    _genomic = Array.new
    for i in 0..p.size-1
      _min = "Z"
      _tempStr = s[p[i]..q[i]]
      if _tempStr.include?("A") then
        _genomic[i] = 1
        elsif _tempStr.include?("C") then
           _genomic[i] = 2
        elsif _tempStr.include?("G") then
           _genomic[i] = 3
        else
           _genomic[i] = 4
      end
    end
    return _genomic
  
  end
  
  def minavgtwoslice(a)
    n = a.size
    if (n == 2)
        return 0
    end

    # initialize the current minimum average of the first two slots.
    minavg = (a[0] + a[1]) / 2.0;
    iResult = 0;

    for i in 2..n-1
        tmp1 = (a[i - 1] + a[i]) / 2.0
        tmp2 = (a[i - 2] + a[i - 1] + a[i]) / 3.0
        
        if (tmp1 < minavg)
            iResult = i - 1
            minavg = tmp1
        end
        if (tmp2 < minavg)
            iResult = i - 2
            minavg = tmp2
        end
    end
    return iResult
  end
  
  def equi(a)
    _result = -1
    n = a.size
    aLeft = Array.new(n,0)
    aRight = Array.new(n,0)
    vSum = a.sum
    aLeft[0] = 0
    aRight[0] = vSum - a[0]
    for i in 1..n-1
      aLeft[i] = aLeft[i-1] + a[i-1]
      aRight[i] = aRight[i-1] - a[i]
      
      if aLeft[i] == aRight[i] then
        _result = i
        break
      end
    end
    return _result
  end

end

