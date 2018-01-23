require 'rails_helper'

RSpec.configure do |c| 
  c.include CodilityHelper
end

RSpec.describe "Arrays" do
  describe "OddOccurrencesInArray" do
    it "OddOccurrencesInArray regular test" do
      a = odd_ocurrences_in_array2([9,3,9,3,9,7,9])
      expect(a).to eq(7)
    end
    it "Cyclic_rotation regular test" do
      a = cyclic_rotation2([3, 8, 9, 7, 6],3)
      expect(a).to eq([9, 7, 6, 3, 8])
    end
    it "Cyclic_rotation larger test" do
      a = cyclic_rotation2([1,2,3,4,5,6,7,8,9],1)
      expect(a).to eq([9,1,2,3,4,5,6,7,8])
    end
    it "Cyclic_rotation larger K" do
      a = cyclic_rotation2([1, 1, 2, 3, 5], 42)
      expect(a).to eq([3, 5, 1, 1, 2])
    end
  end
end

RSpec.describe "Time Complexity" do
  describe "Perm_missing_element2" do
    it "perm_missing_element2 regular test" do
      a = perm_missing_element2([2,3,1,5])
      expect(a).to eq(4)
    end
  end
  describe "TapeEquilibrium2" do
    it "tape_equilibrium2 regular test" do
      a = tape_equilibrium2([3,1,2,4,3])
      expect(a).to eq(1)
    end
    it "tape_equilibrium2 regular test" do
      a = tape_equilibrium2([-10, -5, -3, -4, -5])
      expect(a).to eq(3)
    end
  end
end

RSpec.describe "Counting Elements" do
  describe "FrogRiverOne2" do
    it "frogRiverOne2 regular test" do
      a = frogRiverOne2(5, [1,3,1,4,2,3,5,4])
      expect(a).to eq(6)
    end
  end
  describe "MaxCounter" do
    it "MaxCounter regular test" do
      a = maxCounter(5, [3,4,4,6,1,4,4])
      # puts "Resultado: #{a}"
      expect(a).to eq([3, 2, 2, 4, 2])
    end
    
    it "With 3 maxcounters" do
      a = maxCounter(5, [3,3,6,6,1,3,6])
      expect(a).to eq([3,3,3,3,3])
    end

    it "Minimum array" do
      a = maxCounter(1, [1,2,1,2,1])
      expect(a).to eq([3])
    end
  end
  describe "MissingInteger" do
    it "MissingInteger2 regular test" do
      a = missingInteger2([1, 3, 6, 4, 1, 2])
      expect(a).to eq(5)
    end
    it "MissingInteger2 full array test" do
      a = missingInteger2([1, 2, 3])
      expect(a).to eq(4)
    end
    it "MissingInteger2 negative array test" do
      a = missingInteger2([-1, -2])
      expect(a).to eq(1)
    end
  end
  describe "MaxCounters " do
    it "MaxCounters2  regular test" do
      a = maxCounter2(5, [3,4,4,6,1,4,4])
      expect(a).to eq([3, 2, 2, 4, 2])
    end
  end
end

RSpec.describe "Prefix Sums" do
  describe "CountDiv" do
    it "CountDiv regular test" do
      a = countDiv2(6, 11, 2)
      expect(a).to eq(3)
    end

    it "Large k" do
      a = countDiv2(8, 11, 15)
      expect(a).to eq(0)
    end
    it "Equal a b" do
      a = countDiv2(10, 10, 5)
      expect(a).to eq(1)
    end
    
    it "Zero a b" do
      a = countDiv2(0, 0, 11)
      expect(a).to eq(1)
    end
    
    it "Large b" do
      a = countDiv2(11, 345, 17)
      expect(a).to eq(20)
    end    
  end
  
  describe "PassingCars" do
    it "PassingCars regular test" do
      a = passingCars([0,1,0,1,1], 5)
      expect(a).to eq(5)
    end
  end

  describe "GenomicRangeQuery" do
    it "GenomicRangeQuery regular test" do
      a = genomicRangeQuery("CAGCCTA", [2,5,0], [4,5,6])
      expect(a).to eq([2, 4, 1])
    end
  end

  describe "MinAvgTwoSlice " do
    it "MinAvgTwoSlice  regular test" do
      a = minavgtwoslice([4,2,2,5,1,5,8])
      expect(a).to eq(1)
    end
    it "MinAvgTwoSlice  regular test" do
      a = minavgtwoslice([10, 10, -1, 2, 4, -1, 2, -1])
      expect(a).to eq(5)
    end
  end
  
  describe "Equilibrium " do
    it "Equi regular test" do
      a = equi([-1,3,-4,5,1,-6,2,1])
      expect(a).to eq(1)
    end
  end

end