require 'binary_search_tree'
require 'linked_list'
require 'primes'

module CodilityFibonacciHelper
  include Primes
  # FIBONACCI

  def ladder(a, b, l) # Good answer to combination, but wrong for the statement
    def fact(f)
      return (1..f).reduce(:*) || 1
    end
    arResult = Array[]
    for i in 0..a.size-1
      n = a[i]
      _combinations = fact(n) / (2 * fact(n-2))
      arResult[i] = _combinations % (2**b[i])
    end
    return arResult
  end
  
  def absdistinct(a, n)
    i = 0
    while (i <= a.size-1) do
      if (a[i] >= 0) then break end
      a[i] = a[i].abs
      i+=1
    end
    a.uniq!
    return a.count
  end
  
  def counttriangles(a, n)
    arcomb = a.combination(3).to_a
    _triang = 0
    arcomb.each do |cb|
      if ((cb[0] + cb[1]) > cb[2]) && ((cb[1] + cb[2]) > cb[0]) && ((cb[2] + cb[0]) > cb[1]) then
        _triang += 1
      end
    end
    return _triang    
  end
  
  def countdistinctslices(a)
    n=a.size
    iL = 0; iR = 0
    aSlice = Array.new
    while (iR<n) do
      if iL == iR then
        aSlice.push([iL,iR])
        iR+=1
      else
        if a[iL..iR].size == (a[iL..iR].uniq).size then
          aSlice.push([iL,iR])
          iR+=1
        else
          iL+=1
          iR=iL
        end
      end
    end
    # finishes trating until leftpointer meets right end
    iR-=1
    for i in (iL+1)..iR
      aSlice.push([i,iR])
    end

    return aSlice
  end

  # OTHER EXAMPLES G4G 
  def runbintree(a)
    bst = BinarySearchTree.new(a[0])
    for i in 1..a.size-1
      bst.insert(a[i])
    end
    # Demonstrating Different Kinds of Traversals
    hTraversals = Hash.new
    hTraversals["inOrderTraversal"] = bst.inOrderTraversal
    hTraversals["Pre-Order Traversal"] = bst.preOrderTraversal
    hTraversals["Post-Order Traversal"] = bst.postOrderTraversal
    return hTraversals
  end

  def decimaltobinary(n)
    s = ""
    while n > 0 do
      quotient = n%2
      s = s + quotient.to_s
      n = n/2
    end
    return s.reverse
  end
  
  def generatefibonacci(n)
    def fibo(n, arMemo)
      if (n <= 1) then 
        arMemo[0] = 1
        arMemo[1] = 2
        return arMemo[n] 
      end
      # If we have processed this function before, return the result from the last time. 
      if (arMemo[n] != 0) then 
        return arMemo[n] 
      end
      # Otherwise calculate the result and remember it. 
      arMemo[n] = fibo(n - 1, arMemo) + fibo(n - 2, arMemo)
      return arMemo[n]
    end
    
    arM = Array.new(n+1, 0)
    fibo(n, arM)
    return arM
  end
  
  def binarysearch(a,key)  # a is the sorted array and key is the value to be found
    lo = 0
    hi= a.length-1
    while (lo<=hi)
      mid = lo+((hi-lo)/2)
      
      if a[mid] == key
          return mid
      elsif a[mid] < key
          lo=mid+1
      else
          hi=mid-1
      end
    end
    return mid # this implementation returns the nearest value, instead of -1 if not found
  end
  
  # A O(n^2) time and O(1) space program to find the 
  # longest palindromic substring
  # This function prints the longest palindrome substring (LPS)
  # of str[]. It also returns the length of the longest palindrome
  def longestPalSubstr(str)
    maxLength = 1
    start = 0
    length = str.size
    low = 0
    high = 0
 
    # One by one consider every character as center point of 
    # even and length palindromes
    for i in 1..length
        # Find the longest even length palindrome with center
        # points as i-1 and i.
        low = i - 1
        high = i
        while (low >= 0) and (high < length) and (str[low] == str[high]) do
          if high - low + 1 > maxLength then
            start = low
            maxLength = high - low + 1
          end
          low -= 1
          high += 1
        end
 
        # Find the longest odd length palindrome with center 
        # point as i
        low = i - 1
        high = i + 1
        while (low >= 0) and (high < length) and (str[low] == str[high]) do
          if (high - low + 1) > maxLength then
            start = low
            maxLength = high - low + 1
          end
          low -= 1
          high += 1
        end
    end
 
    # puts "Longest palindrome substring is: start: #{start} maxLength: #{maxLength}"
    # puts str[start, maxLength]
 
    return str[start, maxLength]
  end
  
  # find all positions on str where starts any anagram of searchstr
  def anagramStrSearch(str, searchstr)
    arResult = Array.new(str.size, 0) #initialize each position with false
    searchSize = searchstr.size
    # create all possible anagrams
    arSearch = searchstr.split('') #split chars in array
    arSearch = arSearch.permutation.to_a #create all array permutations
    for i in 0..arSearch.size-1
      arSearch[i] = arSearch[i].join  #join each permutation back as string
    end
    
    # search if str match into  of the anagrams
    for i in 0..str.size-searchSize
      if arSearch.include?(str[i,searchSize]) then
        arResult[i] = 1
      end
    end
    # p arSearch
    return arResult
  end
  
  # l is for left index and r is right index of the
  # sub-array of arr to be sorted
  def mergeSort(arr,l,r)
    # Merges two subarrays of arr[].
    # First subarray is arr[l..m]
    # Second subarray is arr[m+1..r]
    def merge(arr, l, m, r)
      n1 = m - l + 1
      n2 = r- m
   
      # create temp arrays
      aL = Array.new(n1, 0)
      aR = Array.new(n2, 0)
   
      # Copy data to temp arrays L[] and R[]
      for i in 0..n1
        aL[i] = arr[l + i]
      end
   
      for j in 0..n2
        aR[j] = arr[m + 1 + j]
      end
   
      # Merge the temp arrays back into arr[l..r]
      i = 0     # Initial index of first subarray
      j = 0     # Initial index of second subarray
      k = l     # Initial index of merged subarray
   
      while i < n1 and j < n2 do
        if aL[i] <= aR[j] then
          arr[k] = aL[i]
          i += 1
        else
          arr[k] = aR[j]
          j += 1
        end
        k += 1
      end
   
      # Copy the remaining elements of L[], if there
      # are any
      while i < n1 do
        arr[k] = aL[i]
        i += 1
        k += 1
      end
 
      # Copy the remaining elements of R[], if there
      # are any
      while j < n2 do
        arr[k] = aR[j]
        j += 1
        k += 1
      end
    end # merge      
    
    # l is for left index and r is right index of the
    # sub-array of arr to be sorted
    if l < r then
      # Same as (l+r)/2, but avoids overflow for
      # large l and h
      m = (l+(r-1))/2

      # Sort first and second halves
      mergeSort(arr, l, m)
      mergeSort(arr, m+1, r)
      merge(arr, l, m, r)
    end
    return arr
  end # mergeSort
  
  # Dynamic Programming implementation of Longest Common Substring problem
  def lcs(x, y)
    # find the length of the strings
    m = x.size
    n = y.size
 
    # declaring the array for storing the dp values
    # Array.new(Number_of_ROWs){Array.new(Number_of_COLUMNs)}
    mL = Array.new(m+1){Array.new(n+1)}
    # Following steps build L[m+1][n+1] in bottom up fashion
    #Note: L[i][j] contains length of LCS of X[0..i-1] and Y[0..j-1]
    for i in 0..m do
      for j in 0..n do
        if (i == 0) or (j == 0) then
          mL[i][j] = 0
        elsif x[i-1] == y[j-1]
            mL[i][j] = mL[i-1][j-1]+1
        else
          mL[i][j] = [mL[i-1][j], mL[i][j-1]].max
        end
      end
    end
    # mL[m][n] contains the length of LCS of X[0..n-1] & Y[0..m-1]
    return mL[m][n]
  end
  
  # A numeric array of length N is given. 
  # We need to design a function that finds all positive numbers in the array that have their opposites in it as well.
  def positiveopposite(a)
    # create hashtable that will store the array of opposite values
    hTable = Hash.new 
    for i in 0..a.size-1 do
      if hTable[a[i].abs] == nil then
        hTable[a[i].abs] = [a[i]]
      end

      case
        when a[i] < 0
          # insert negative if there exists a positive number in first position of the array
          # if the hashtable already has a negative number, do nothing
          if hTable[a[i].abs][0] > a[i] then 
            hTable[a[i].abs].insert(0,a[i])
          end
        when a[i] > 0
          # insert positive number if the array has only the first negative opposite element
          if (hTable[a[i].abs][0] < 0) and (hTable[a[i].abs].size == 1) then 
            hTable[a[i].abs].push(a[i])
          end
      end
    end
    # p hTable
    aResult = []
    hTable.each { |key, value| 
      if (value.size == 2) then
        aResult.push(value)
      end
    }
    return aResult
  end
  
  # program to find Minimum number of jumps to reach end
  # Returns minimum number of jumps to reach arr[n-1] from arr[0]
  def minimumjumps(arr, n)
    jumps = Array.new(n, 0)
 
    if (n == 0) or (arr[0] == 0) then
      return Float::INFINITY
    end
 
    jumps[0] = 0
 
    # Find the minimum number of jumps to reach arr[i] from 
    # arr[0] and assign this value to jumps[i]
    for i in 1..n
      jumps[i] = Float::INFINITY
      for j in 0..i
        if (i <= j + arr[j]) and (jumps[j] != Float::INFINITY) then
          jumps[i] = [jumps[i], jumps[j] + 1].min
          break
        end
      end
    end
    return jumps[n-1]    
  end
  
  def buildlinkedList
    list = LinkedList.new
       
    list.append(10)
    list.append(20)
    list.append(30)
     
    list.insert_after(10, 15)
    list.insert_after(20, 25)
     
    return list.print
  end  
  
  def searchlinkedList
    list = LinkedList.new
       
    list.append(10)
    list.append(20)
    list.append(30)
     
    list.insert_after(10, 15)
    list.insert_after(20, 25)
    
    node = list.find(10)
    return list.lenght(node)
     
  end
  
  # puts pivot element on the correct position. All elements to the left will be smaller and to the right will be bigger
  # This implementation picks medium element as pivot. Used on QuickSort
  def partition(arr,low,high)
    left = low
    right = high
    iPivot = low+(high-low)/2
    pivot = arr[iPivot]
    # puts "iPivot: #{iPivot}  pivot: #{pivot}"
    while left < right do
      while arr[left] < pivot do
        left += 1
      end      
      while arr[right] > pivot do
        right -= 1
      end
      # puts "left: #{left}  right: #{right}"
      if arr[left] > arr[right] then
        arr[left],arr[right] = arr[right],arr[left]
      end
    end
    # p arr
    return arr.index(pivot)
  end
  
  # Function to do Quick sort
  def quickSort(arr,low,high)
    if low < high then
      # pi is partitioning index, arr[p] is now
      # at right place
      pivot = partition(arr,low,high)

      # Separately sort elements before
      # partition and after partition
      quickSort(arr, low, pivot-1)
      quickSort(arr, pivot+1, high)
    end
    return arr
  end
  
  # arr is a two dimensional array
  # Maximum size square sub-matrix with all 1s
  def maximumSquareSize(arr)
    rows = arr.length
    cols = arr[0].length
    # Create matrix Size and copy first row and first columns as it is from M[][] to S[][]
    size = Array.new(rows) { Array.new(cols, 0) }
  	for i in 0..rows-1
  		size[i, 0] = 0
  	end
  	for i in 0..cols-1
  		size[0, i] = 0
  	end
  	# Find the max Square and set it at size matrix 
  	for i in 1..rows-1
  		for j in 1..cols-1
        if (arr[i][j] == 1) then
          size[i][j] = [size[i][j-1], size[i-1][j], size[i-1][j-1]].min + 1
        else
          size[i][j] = 0  		
        end
  		end
  	end
    # Find the maximum entry and
    # indices of maximum entry in S[][]
    max_of_s = size[0][0]
    max_i = 0
    max_j = 0
    for i in 0..rows-1
      for j in 0..cols-1
        if (max_of_s < size[i][j]) then
          max_of_s = size[i][j]
          max_i = i
          max_j = j  	
        end
      end
    end
    # puts "max_of_s: #{max_of_s}  max_i: #{max_i}  max_j: #{max_j} "
  	return [max_of_s, max_i, max_j]
  end

  def splitArray(arr, x)
    
    lenght = arr.size
    countxLeft = Array.new(lenght,0)
    countOtherLeft = Array.new(lenght,0)
    countxRight = Array.new(lenght,0)
    countOtherRight = Array.new(lenght,0)
    i = 1 
    j = lenght-2
    while (i <= lenght-1) do
      # traverse the array from left to right and from right to left on the same loop building the arrays
      # that count occurences of x and non-x values
      if arr[i-1] == x then
        countxLeft[i] = countxLeft[i-1] + 1
        countOtherLeft[i] = countOtherLeft[i-1]
      else
        countOtherLeft[i] = countOtherLeft[i-1] + 1
        countxLeft[i] = countxLeft[i-1]
      end
      i+=1
      if arr[j+1] == x then
        countxRight[j] = countxRight[j+1] + 1
        countOtherRight[j] = countOtherRight[j+1]
      else
        countOtherRight[j] = countOtherRight[j+1] + 1
        countxRight[j] = countxRight[j+1]
      end
      j-=1
    end
    # find the position where ocurrences of x and non-x match in both sides of array
    for i in 0..lenght-1
      if countxLeft[i] == countOtherRight[i]
        break
      end
      if countxRight[i] == countOtherLeft[i]
        break
      end
    end
    if i < lenght-1 then
      return i
    else 
      return -1
    end
    
  end


end

