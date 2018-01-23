require 'rails_helper'

RSpec.configure do |c| 
  c.include CodilitySortingHelper
end

RSpec.describe "Sorting Elements" do
  describe "Distinct" do
    it "Distinct regular test" do
      a = distinct([2,1,1,2,3,1], 6)
      # puts "Resultado: #{a}"
      expect(a).to eq(3)
    end
    
  end
  describe "Triangle" do
    it "Triangle positive test" do
      a = triangle2([10,2,5,1,8,20], 6)
      expect(a).to eq(1)
    end
    it "Triangle negative test" do
      a = triangle2([10,50,5,1], 4)
      expect(a).to eq(0)
    end
  end
  
  describe "MaxProductOfThree " do
    it "MaxProductOfThree regular test" do
      a = maxproductofthree([-3,1,2,-2,5,6])
      expect(a).to eq(60)
    end
    it "MaxProductOfThree regular test" do
      a = maxproductofthree([-5, 5, -5, 4])
      expect(a).to eq(125)
    end
  end

  describe "numberOfDiscIntersections" do
    it "numberOfDiscIntersections regular test" do
      a = numberOfDiscIntersections2([1,5,2,1,4,0], 6)
      expect(a).to eq(11)
    end
  end
end

RSpec.describe "Stacks and Queues" do
  describe "brackets" do
    it "brackets regular test" do
      a = brackets(("{[()()]}"))
      expect(a).to eq(1)
    end
    it "brackets negative test" do
      a = brackets(("([)()]"))
      expect(a).to eq(0)
    end
    it "brackets all open" do
      a = brackets(("{{{["))
      expect(a).to eq(0)
    end
    it "brackets all close" do
      a = brackets(("}}}]"))
      expect(a).to eq(0)
    end
  end

  describe "fish" do
    it "fish statement test" do
      a = fish2([4,3,2,1,5], [0,1,0,0,0])
      expect(a).to eq(2)
    end
    it "fish regular test" do
      a = fish2([4,3,2,1,5,6,7,8,9], [0,1,0,0,0,1,0,0,1])
      expect(a).to eq(5)
    end
    it "fish other test" do
      a = fish2([4,3,2,1,5,7,8], [0,0,1,0,0,1,0])
      expect(a).to eq(4)
    end
    it "fish big eater test" do
      a = fish2([10,3,2,1,5,6,7,8,9], [1,0,0,0,0,1,0,0,0])
      expect(a).to eq(1)
    end
  end
end

RSpec.describe "Leader" do

  describe "Leader" do
    it "Leader test" do
      a = leader([4,3,4,4,4,2])
      expect(a).to eq(4)
    end
    it "Leader one element" do
      a = leader([3])
      expect(a).to eq(3)
    end
    it "Leader small" do
      a = leader([2,2])
      expect(a).to eq(2)
    end
    it "Leader negative test" do
      a = leader([3,1,1,1,3,3,3,2])
      expect(a).to eq(-1)
    end
  end

  describe "equileader" do
    it "equileader test" do
      a = equileader2([4,3,4,4,4,2], 6)
      expect(a).to eq(2)
    end
  end
  
  describe "dominator" do
    it "dominator test" do
      a = dominator([3,4,3,2,3,-1,3,3], 8)
      expect(a).to eq(0)
    end
  end
  
  describe "BugFixingLeader" do
    it "BugFixingLeader regular test" do
      a = bugfixingleader([4,2,2,3,2,4,2,2,6,4])
      expect(a).to eq(-1)
    end
    it "BugFixingLeader leader test" do
      a = bugfixingleader([1,1,1,50,2,1])
      expect(a).to eq(1)
    end
  end
  
  
end