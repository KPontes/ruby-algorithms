require 'rails_helper'
require 'rectangle'

RSpec.configure do |c| 
  c.include CodilityFibonacciHelper
end

RSpec.describe "ladder Elements" do
  describe "ladder" do
    it "ladder regular test" do
      a = ladder([4,4,5,5,1], [3,2,4,3,1], 5)
      expect(a).to eq([6, 2, 10, 2, 0])
    end
    it "ladder one test" do
      a = ladder([7], [3], 1)
      expect(a).to eq( [5])
    end
  end
  describe "absdistinct" do
    it "absdistinct regular test" do
      a = absdistinct([-5,-3,-1,0,3,6], 6)
      expect(a).to eq(5)
    end
    it "absdistinct small negative test" do
      a = absdistinct([-10], 1)
      expect(a).to eq(1)
    end
    it "absdistinct all negative test" do
      a = absdistinct([-2, -2], 2)
      expect(a).to eq(1)
    end
  end
  describe "counttriangles" do
    it "counttriangles regular test" do
      a = counttriangles([10,2,5,1,8,12], 6)
      expect(a).to eq(4)
    end
  end
  describe "countDistinctSlices" do
    it "countDistinctSlices regular test" do
      a = countdistinctslices([3,4,5,5,2])
      expect(a).to eq([[0, 0], [0, 1], [0, 2], [1, 1], [1, 2], [2, 2], [3, 3], [3, 4], [4, 4]])
    end
    it "countDistinctSlices bigger test" do
      a = countdistinctslices([3, 4, 3, 5, 5, 2, 2, 3])
      expect(a).to eq([[0, 0], [0, 1], [1, 1], [1, 2], [1, 3], [2, 2], [2, 3], [3, 3], [4, 4], [4, 5], [5, 5], [6, 6], [6, 7], [7, 7]])
    end
  end
end  

RSpec.describe "InterviewBit" do
  describe "Binary Tree" do
    it "Run Bin Tree regular test" do
      a = runbintree([10,11,9,5,7,18,17])
      expect(a).to eq({"inOrderTraversal"=>["5", "7", "9", "10", "11", "17", "18"], "Pre-Order Traversal"=>["7", "5", "9", "17", "18", "11", "10"], "Post-Order Traversal"=>["10", "9", "5", "7", "11", "18", "17"]})
    end
  end

  describe "Math" do
    it "Factorization regular test" do
      a = findallfactors(36)
      expect(a).to eq([1,2,3,4,6,9,12,18,36])
    end
    it "DecimaltoBinary regular test" do
      a = decimaltobinary(125)
      expect(a).to eq("1111101")
    end
    it "SievePrimes regular test" do
      a = sieveprimes(25)
      expect(a).to eq([0, 0, 1, 1, 0, 1, 0, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 1, 0, 0])
    end
    it "Fibonacci regular test" do
      a = generatefibonacci(9)
      expect(a).to eq([1, 2, 3, 5, 8, 13, 21, 34, 55, 89])
    end
    it "Binary search regular test" do
      a = binarysearch([2,5,8,10,15,23,35,44,48,52,61,67,77],67)
      expect(a).to eq(11)
    end
    it "Longest palindrome search regular test" do
      a = longestPalSubstr("forgeeksskeegfor")
      expect(a).to eq("geeksskeeg")
    end
    it "Anagrams substring search regular test" do
      a = anagramStrSearch("BACDGABCDA", "ABCD")
      expect(a).to eq([1, 0, 0, 0, 0, 1, 1, 0, 0, 0])
    end
    it "MergeSort regular test" do
      arr = [12, 11, 13, 5, 6, 7]
      n = arr.size
      a = mergeSort(arr,0,n-1)
      expect(a).to eq([5, 6, 7, 11, 12, 13])
    end
    it "LCS regular test" do
      x = "AGGTAB"
      y = "GXTXAYB"
      a = lcs(x, y)
      expect(a).to eq(4)
    end
    it "PositiveOpposite regular test" do
      a = positiveopposite([-7, 4, -3, 2, 2, -8, -2, 3, 3, 7, -2, 3, -2])
      expect(a).to eq([[-7, 7], [-3, 3], [-2, 2]])
    end    
    it "MinimumJumps regular test" do
      arr = [1, 3, 6, 1, 0, 9]
      size = arr.size
      a = minimumjumps(arr,size)
      expect(a).to eq(3)
    end
    it "Linked List regular test" do
      a = buildlinkedList
      expect(a).to eq(["10", "15", "20", "25", "30"])
    end
    it "Linked List search test" do
      a = searchlinkedList
      expect(a).to eq(5)
    end
    it "Partition regular test" do
      a = partition([10,7,8,9,1,5],0,5)
      expect(a).to eq(3)
    end
    it "Partition partial array test" do
      a = partition([2,10,7,8,9,1,5,12,15,3],3,9)
      expect(a).to eq(5)
    end
    it "Quicksort regular test" do
      a = quickSort([2,10,7,8,9,1,5,12,15,3],0,9)
      expect(a).to eq([1, 2, 3, 5, 7, 8, 9, 10, 12, 15])
    end    
    it "Largest Square regular test" do
      # arr = Array.new(4) { Array.new(4, 0) }
      mtx = [[0, 1, 1, 0, 1],
          [1, 1, 0, 1, 0],
          [0, 1, 1, 1, 0],
          [1, 1, 1, 1, 0],
          [1, 1, 1, 1, 1],
          [0, 0, 0, 0, 0]]
      a = maximumSquareSize(mtx)
      expect(a).to eq([3,4,3])
    end
    it "Rectangle intersect regular test" do
      rec1 = Rectangle.new(2,9,5,4)
      rec2 = Rectangle.new(4,6,5,3)
      a = rec1.intersect?(rec2)
      expect(a).to eq(true)
    end
    it "Rectangle intersect negative test" do
      rec1 = Rectangle.new(2,9,5,2)
      rec2 = Rectangle.new(3,3,5,3)
      a = rec1.intersect?(rec2)
      expect(a).to eq(false)
    end
    it "splitArray regular test" do
      a = splitArray([5,5,2,3,5,1,6], 5)
      expect(a).to eq(3)
    end
    it "Euclidean Greatest Common Divisor" do
      a = gcd(24,9)
      expect(a).to eq(3)
    end
      
  end

end

