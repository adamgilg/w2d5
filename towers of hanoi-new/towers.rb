# Adam Gilgoff and Erik Trautman 1/18/13
# Totally unplayable playable game... but perfectly tested!
class Towers

  attr_accessor :height, :tower_array

  def initialize(height)
    @height = height
    @tower_array = [(1..height).to_a.reverse,[],[]]
  end

  def get_user_input
    puts "Input tower-from, tower-to:"
    gets.chomp.split(',').map!(&:to_i)
  end

  def is_valid?(user_input)
     out_of_bounds?(user_input) && correct_length?(user_input) && disks_okay?(user_input)
  end

  def out_of_bounds?(user_input)
    (0..2).include?(user_input[0]) && (0..2).include?(user_input[1])
  end

  def correct_length?(user_input)
    user_input.size == 2
  end

  def disks_okay?(user_input)
    from, to = user_input
    unless @tower_array[from].empty?
      if @tower_array[to].empty? || @tower_array[from].last < @tower_array[to].last
        return true
      else
        return false
      end
    else
      false
    end
  end

  def victory?
    tower_array[0].empty? && ( tower_array[1].empty? || tower_array[2].empty? )
  end

  def move(tower_pair)
    @tower_array[tower_pair[1]] << @tower_array[tower_pair[0]].pop
  end

end
