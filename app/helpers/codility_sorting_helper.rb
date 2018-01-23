module CodilitySortingHelper
  
  #SORTING
  def distinct(a, n)
    a.uniq!
    return a.size
  end
  
  def triangle(a, n)
    _comb = a.combination(3).to_a
    _triang = 0
    _comb.each do |cb|
      if ((cb[0] + cb[1]) > cb[2]) && ((cb[1] + cb[2]) > cb[0]) && ((cb[2] + cb[0]) > cb[1]) then
        _triang = 1
      end
      break if _triang == 1   
    end
    return _triang
  end
  
  def triangle2(a, n)
    a.sort!
    for i in 0..a.size-3
      if ((a[i] + a[i+1]) > a[i+2]) then # since a[r] is always bigger through the sort, this is the only constraint to test
        return 1
      end
    end
    return 0
  end
  
  def maxproductofthree(a)
    a.sort!
    s = a.size
    result1 = a[s-1] * a[s-2] * a[s-3]
    result2 = a[0] * a[1] * a[s-1]
    return [result1,result2].max
  end
  
  def numberOfDiscIntersections(a, n)
    
    _circle = Array.new
    _result = 0
    for i in 0..a.size-1
      _circle[i] = (i-a[i]..i+a[i])
    end
    #puts _circle

    for i in 0.._circle.size-2
      for j in (i+1).._circle.size-1
        if (_circle[i].include?_circle[j].begin) or (_circle[i].include?_circle[j].end) or
           (_circle[j].include?_circle[i].begin) or (_circle[j].include?_circle[i].end) then
          _result +=1
        end
      end
    end
    return _result
  end
  
  def numberOfDiscIntersections2(a, n)
    
    aCircle = Array.new
    _result = 0
    for i in 0..a.size-1
      aCircle[i] = (i-a[i]..i+a[i])
    end
    aCircle.sort_by!(&:min)
    # p aCircle

    for i in 0..aCircle.size-2
      for j in (i+1)..aCircle.size-1
        if (aCircle[i].include?aCircle[j].begin) then # as it is sorted, j begin is always bigger then i begin
          _result +=1
        else
          break
        end
      end
    end
    return _result
  end
  
  # STACKS & QUEUES
  def stonewall(h, n)
    _queue = Hash.new
    _count = 0    
    for i in 0..h.size-1
      if _queue[h[i]] == nil then
        _queue[h[i]] = [i]
      else
        _queue[h[i]].push(i)
      end
      _count+=1
    end

    _queue.each { |key, value| 

      for i in 0..value.size-2
        if (value[i]+1) == value[i+1] then
          _count-=1
        else
          _decrementa = true
          for j in (value[i]..value[i+1])
            if h[j] < key then
              _decrementa = false
            end
          end
          if _decrementa then
            _count-=1
          end
        end
      end

    }
    return _count
      
  end

  def brackets(s)
    _open = Array[]
    _close = Array[]
    _result = 1
     
    for i in 0..s.size-1
      #empilha
      case s[i]
        when "{"
          _open.push(1)
        when "["
          _open.push(2)
        when "("
          _open.push(3)
        when "}"
          _close.push(1)
        when "]"
          _close.push(2)
        when ")"
          _close.push(3)
        else
          _result = 0
      end

      #desempilha
      if  "}])".include? s[i] then
        if _close.pop != _open.pop then
          _result = 0
          break
        end
      end
    end
    if _close.size != _open.size then
      _result = 0
    end
    return _result    
  end

  def fish(a, b)
    _up = Array[]
    _down = Array[]
    _death = Array[]
    _alive = Array[]
    iup = 0 
    idown = 0
    # load fishes up and down in separate arrays
    for i in 0..b.size-1
      if b[i] == 0 then
        _up[iup] = i
        iup+=1
      else
        _down[idown] = i
        idown+=1
      end
    end

    # move on both arrays obtaining death and alive
    while (_up.size > 0) && (_down.size > 0) do
      if (_up[0] < _down[0]) then
        _alive.push(_up[0])
        _up.delete_at(0)
      else
        # biggest fish eats the other
        if a[_up[0]] > a[_down[0]] then
          _death.push(_down[0])
          _down.delete_at(0)
        else
          _death.push(_up[0])
          _up.delete_at(0)
        end
      end
    end
    _alive.concat(_up)
    _alive.concat(_down)
    #puts "***********"    
    #puts "Alive"    
    #p _alive    
    #puts "Death"    
    #p _death    
 
    return (_alive.size)
    
  end
  
  def fish2(a, b)
    aDownstrem = Array[]
    aAlive = Array[]
    for i in 0..a.size-1
      if b[i] == 0 then
        while aDownstrem.size > 0 do
          if aDownstrem[-1] < a[i] then
            aDownstrem.pop
          else 
            break
          end
        end
        if aDownstrem.empty? then
          aAlive.push(a[i])
        end        
      else
        aDownstrem.push(a[i])
      end
    end
    aAlive = aAlive + aDownstrem
    return aAlive.size
    
  end  
  
  # LEADER
  def equileader(a, n)
    
    def leader(v)
      aSort = v.sort
      _middle = aSort.size/2
      _result = -1
      if aSort.size == 1 then
        _result = aSort[0]
      else 
        if (aSort.size == 2) then
          if (aSort[0] == aSort[1]) then
            _result = aSort[0]
          end
        end
      end
      if (_result == -1) && (aSort.size > 2) then
        if aSort.count(aSort[_middle]) >= (_middle + 1) then
          _result = aSort[_middle]
        end
      end
      return _result
    end

    _lead = leader(a)

    if _lead == -1 then
      return 0
    else
      _lead = a[_lead]
    end

    _equilead = 0
    for i in 0..a.size-1
      _slice1 = a[0..i]
      _slice2 = a[(i+1)..(a.size-1)]
      _lead1 = leader(_slice1)
      _lead2 = leader(_slice2)
      # try equileadership
      if (_lead1 != -1) && (_lead2 != -1) then
        if (_lead1 ==  _lead2) then
          _equilead+=1
        end
      end
    end
    return _equilead
  end
  
  def leader(v)
    aSort = v.sort
    _middle = aSort.size/2
    _result = -1
    if (aSort.count(aSort[_middle]) * 2) > aSort.size then
      _result = aSort[_middle]
    end
    return _result
  end  
  
  def equileader2(a, n)
    # Key concept is that the same leader applies for slice leaders. if there is no leader, there won't be slice leader
    len = a.size
    _lead = leader(a)
    if _lead == -1 then 
      return 0
    end

    countLead = a.count(_lead)
    equiLead = 0
    aSlice1 = []
    # counters of leader occurrences on each slice. All this bullshit is not to use array.count each time, due to O(n)
    c1 = 0; c2 = 0 
    for i in 0..len-1
      aSlice1.push(a[i])
      aSlice2 = a[(i+1)..(len-1)]
      if a[i] == _lead then
        c1+=1
        c2 = countLead - c1
      end
      if (c1 * 2) > i+1 then
        if (c2 * 2) > len-(i+1) then
          equiLead+=1
        end
      end
    end
    return equiLead
  end  

  def dominator(a, n)
    _index = Hash.new
    if a.size == 0 then  return -1  end

    for i in 0..a.size-1
      if _index[a[i]] == nil then
        _index[a[i]] = [i]
      else
        _index[a[i]].push(i)
      end    
    end
    _max = 0 
    _maxkey = 0

    _index.each { |key, value| 
      if (value.size > _max) then
        _max = value.size
        _maxkey = key
      end

    }
    if _index[_maxkey].size >= (1 + a.size/2) then
      return _index[_maxkey][0]
    else
      return -1
    end
    
  end
  
  def bugfixingleader(a) # DOMINATOR2
    n = a.size
    hLeader = Hash.new
    for i in 0..n-1
      if hLeader[a[i]] == nil then
        hLeader[a[i]] = 1
      else
        hLeader[a[i]] = hLeader[a[i]] + 1
      end   
    end
    candidate = 0
    hLeader.each { |key, value| 
      if (value > candidate) then
        candidate = key
      end
    }
    
    if (2*hLeader[candidate] > n) then
      return candidate
    else
      return -1
    end
  end

  
end

