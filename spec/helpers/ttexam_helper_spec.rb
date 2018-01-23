require 'rails_helper'
require 'rectangle'

RSpec.configure do |c| 
  c.include TtexamHelper
end

RSpec.describe "TopTal Exam" do
  describe "Question1" do
    it "Q1 regular test" do
      a = question1([6,10,6,9,7,8])
      expect(a).to eq(3)
    end
    it "Q1 negative" do
      a = question1([-6,-10,-5,-9,-7,-8])
      expect(a).to eq(2)
    end
    it "Q1 small" do
      a = question1([-1,-5])
      expect(a).to eq(1)
    end
    it "Q1 one" do
      a = question1([-1])
      expect(a).to eq(1)
    end
  end
  
  describe "Question2" do
    it "Q2 regular test" do
      a = question2([1,5,4,9,8,7,12,13,14])
      expect(a).to eq(6)
    end
    it "Q2 regular test" do
      a = question2([4,3,2,6,1])
      expect(a).to eq(1)
    end
    it "Q2 paulinha test" do
      a = question2([1,20,15,12,17,19,40,52])
      expect(a).to eq(4)
    end
  end
  describe "Question3" do
    it "Q3 regular test" do
      # a = ladder([4,4,5,5,1])
      # expect(a).to eq([6, 2, 10, 2, 0])
    end
  end

end  