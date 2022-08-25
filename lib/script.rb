#Binary tree needed

#Create a game board and a knight.

# knight is a node in a binary search tree
class Knight
  attr_accessor :position, :possible_moves, :parent
  def initialize(position, parent)
    @position = position
    @possible_moves = []
    @parent = parent
  end
end

# the tree in a binary tree search structure
class Board
  def initialize()
    @knight = nil
    @found = false
    @target = []
    
  end

  public

  def knight_moves(start, finish)
    @knight = Knight.new(start, nil)
    build_possible_moves(@knight)
    
    #level_order queue setup
    queue = []

    queue.append(@knight)
    current = queue[0]
    # actual level_order search, ends when shortest order found
    until current.position == finish
      current.possible_moves.each {|sub_knight| queue.append(sub_knight)}
      queue.shift
      current = queue[0]
    end

    # gets the final path
    knight_with_shortest = current
    path = []
    while knight_with_shortest != @knight
      path.prepend(knight_with_shortest.position)
      knight_with_shortest = knight_with_shortest.parent
    end
    path.prepend(@knight.position)
    # returns final path
    path
  end
  
  private

  def build_possible_moves(knight, count = 0)
    # puts a limit to the depth of the search because of processing
    return nil if count > 6
    
    # finds all possible moves
    changes = [[1, 2], [-2, -1], [-1, 2], [2, -1],[1, -2], [-2, 1], [-1, -2], [2, 1]].freeze
    possible_positions = changes.map do |change|
      [knight.position[0] + change[0], knight.position[1] + change[1]]
    end

    # made_moves is to be added to knight.possible_moves
    made_moves = []
    # starts recursion for every possible path
    possible_positions.each do |position|
      # checks that it hasn't exited the board
      unless position[0] > 7 || position[0] < 0 || position[1] > 7 || position[1] < 0
        # starts new recursion
        new_knight = Knight.new(position, knight)
        build_possible_moves(new_knight, count + 1)
        # saves the made moves on each knight
        made_moves.append(new_knight)
      end
    end
    # adds possible moves to knight and returns
    knight.possible_moves = made_moves
    knight
  end
end

board = Board.new()
p board.knight_moves([0,0],[7,7])
