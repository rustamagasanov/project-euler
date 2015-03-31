module InputMatrix
  def self.content
    [ %w[75],
      %w[95 64],
      %w[17 47 82],
      %w[18 35 87 10],
      %w[20  4 82 47 65],
      %w[19  1 23 75  3 34],
      %w[88  2 77 73  7 63 67],
      %w[99 65  4 28  6 16 70 92],
      %w[41 41 26 56 83 40 80 70 33],
      %w[41 48 72 33 47 32 37 16 94 29],
      %w[53 71 44 65 25 43 91 52 97 51 14],
      %w[70 11 33 28 77 73 17 78 39 68 17 57],
      %w[91 71 52 38 17 14 91 43 58 50 27 29 48],
      %w[63 66  4 68 89 53 67 30 73 16 69 87 40 31],
      %w[ 4 62 98 27 23  9 70 98 73 93 38 53 60  4 23] ]
  end
end

module Tree
  def self.fetch_neighbors(current_node)
    if InputMatrix.content[current_node.i + 1] == nil
      $res << current_node.path_score
      return
    end

    neighbors = [Node.new(current_node.i + 1, current_node.j,     current_node),
      Node.new(current_node.i + 1, current_node.j + 1, current_node)]

    neighbors.each { |neighbor| fetch_neighbors(neighbor) }
  end
end

class Node
  attr_accessor :i, :j, :prev, :path_score

  def initialize(i, j, prev = nil)
    @i, @j, @prev = i, j, prev

    @path_score =
      if prev == nil
        InputMatrix.content[i][j].to_i
      else
        prev.path_score + InputMatrix.content[i][j].to_i
      end
  end
end

$res = []
Tree.fetch_neighbors(Node.new(0, 0))
puts $res.max

