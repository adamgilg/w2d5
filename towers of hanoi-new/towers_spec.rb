require './towers.rb'


describe Towers do
  subject(:towers) { Towers.new(4) }

  describe "height input" do
    its(:height) { should be (4) }
  end

  describe "initial setup:" do
    #specify { :tower_array[0].size should eq(4) }
    it "has appropriate first tower height" do
      towers.tower_array[0].size.should eq(4)
    end

    it "has empty second and third towers" do
      towers.tower_array[1..2].each do |tower|
        tower.should be_empty
      end
      # towers.tower_array[1].should be_empty
      # towers.tower_array[2].should be_empty
    end

    it "has first tower stacked in descending order" do
      towers.tower_array[0].should eq((1..4).to_a.reverse)
    end
  end

  describe "user input validation:" do
    before(:each) do
      towers.tower_array = [[4,3,2], [1], []]
    end

    it "returns false for incorrect user input formats" do
      [["a","b"], "a,b", [1,2,3], ["1","2"]].each do |bad_input|
        towers.is_valid?(bad_input).should be_false
      end
    end

    it "returns false for out of bounds user input" do
      [[-1, 1], [0, 3], [9, 5]].each do |bad_input|
        towers.out_of_bounds?(bad_input).should be_false
      end
    end

    it "returns false if user moves from empty tower" do
      towers.disks_okay?([2, 1]).should be_false
    end

    it "returns false if user moves larger disk onto smaller disk" do
      towers.disks_okay?([0,1]).should be_false
    end

    it "returns true if user moves smaller disk onto larger disk" do
      towers.disks_okay?([1,0]).should be_true
    end

    it "returns true if user moves disk onto empty tower" do
      towers.disks_okay?([1,2]).should be_true
    end

    it "returns true for correctly formatted in-bounds input" do
      [[0,2],[1,0],[1,2]].each do |good_input|
        towers.is_valid?(good_input).should be_true
      end
    end

  end

  describe "game over conditions" do
    it "return true if victory is achieved" do
      towers.tower_array = [[],[],[4,3,2,1]]
      towers.victory?.should be_true
    end

    it "return false if victory has not been achieved" do
      towers.tower_array = [[],[1],[4,3,2]]
      towers.victory?.should be_false
    end
  end

  describe "moving disks" do
    it "will move disks" do
      towers.move([0,1])
      towers.tower_array[1].should eq([1])
    end
  end
end









