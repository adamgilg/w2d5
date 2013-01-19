require './w1d1_test_code.rb'

describe Array do

  subject(:array) { [1, 2, 5, 4, 2, 1] }

  describe "#my_uniq" do
    it "returns only the unique elements of an array" do
      array.my_uniq.should eq ([1, 2, 5, 4])
    end
  end


end