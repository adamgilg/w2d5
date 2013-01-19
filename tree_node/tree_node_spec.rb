require "./tree_node.rb"

describe TreeNode do
  subject(:treenode) { TreeNode.new(1) }

  its(:value) { should_not be_nil }

  before(:each) do
    @t2 = TreeNode.new(2)
    @t3 = TreeNode.new(3)
    @t4a = TreeNode.new(4)
    @t5 = TreeNode.new(5)
    @t4b = TreeNode.new(4)
    treenode.left = @t2
    treenode.right = @t4a
    @t2.left = @t3
    @t2.right = @t4b
    @t4a.left = @t5

  end

  describe "children:" do
      its(:left) { should_not be_nil }
      its(:right) { should_not be_nil }
  end

  describe "breadth first search" do
    it "returns false if value isn't found" do
      treenode.bfs(6).should be_false
    end

    it "returns itself if it has the desired value" do
      @t5.bfs(5).should eq(@t5)
    end

    it "returns a TreeNode object with correct value if value is found" do
      treenode.bfs(5).should eq(@t5)
    end

    it "returns the fastest search option" do
      treenode.bfs(4).should eq(@t4a)
    end

  end

  describe "depth first search" do
    it "returns false if value isn't found" do
      treenode.dfs(6).should be_false
    end

    it "returns itself if it has the desired value" do
      @t5.dfs(5).should eq(@t5)
    end

    it "returns a TreeNode object with correct value if value is found" do
      treenode.dfs(5).should eq(@t5)
    end

    it "returns the deepest search option" do
      treenode.dfs(4).should eq(@t4b)
    end
  end


end

