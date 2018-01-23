require 'binary_search_tree'
require 'linked_list'
require 'primes'
module TtexamHelper
  include Primes
  
  def tryconnections(n)
    return sieveprimes2(n)
  end
  
  def question1(a)
    n=a.size
    if n==1 then
      return 1
    end
    a.sort!
    longestSeq = 0
    count = 0
    candidate = a[0]
    aSeq = [a[0]]
    for i in 1..n-1
      if (candidate == a[i]) or (candidate == a[i]-1) or (candidate-1 == a[i]) then
        aSeq.push(a[i])
      else
        if aSeq.size > longestSeq then
          longestSeq = aSeq.size
        end
        aSeq.clear
        candidate = a[i]
      end
    end
    return longestSeq
  end
  
  def question2(a)
    n = a.size
    if n==1 then
      return 1
    end
    aGroups = Array.new
    aGroups[0] = [a[0]]
    ig = 0
    puts "*****"
    p a
    for i in 1..n-1
      if aGroups[ig][aGroups[ig].size-1] < a[i] then
        ig+=1
        aGroups[ig] = [a[i]]
      else
        aGroups[ig].push(a[i])
      end
    end
    p aGroups
    n = aGroups.size
    for i in (n-1).downto(1)
      if aGroups[i].max < aGroups[i-1].max then
        aGroups[i-1] = aGroups[i-1] + aGroups[i]
        aGroups.pop
      end
    end
    p aGroups
    
    result = aGroups.size
  end
  
end