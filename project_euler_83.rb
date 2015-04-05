require 'singleton'

class MatrixAnalyzer
  include Singleton
  attr_accessor :content
  attr_reader :d, :h

  def set_d
    if @d.nil?
      (0...content.size).each do |i|
        (0...content.size).each do |j|
          @d = content[i][j] if @d.nil? || @d > content[i][j]
        end
      end
    end
    @d
  end

  # Heuristic matrix(based on Manhattan distance)
  def set_h
    if @h.nil?
      @h = []
      (0...content.size).each do |i|
        @h[i] ||= []
        (0...content.size).each do |j|
          dx = (i - content.size + 1).abs
          dy = (j - content.size + 1).abs
          h[i][j] = d * (dx + dy)
        end
      end
    end
    @h
  end
end

class Node
  attr_reader :i, :j, :matrix, :prev, :g, :f

  def initialize(i, j, prev_node = nil)
    @matrix = MatrixAnalyzer.instance

    @i, @j = i, j
    @prev = prev

    set_g
    set_f
  end

  def prev=(prev)
    @prev = prev

    set_g
    set_f
  end

  # f = g + h
  def set_f
    @f = g.to_i + matrix.h[i][j]
  end

  def set_g
    @g =
      if prev.nil?
        matrix.content[i][j]
      else
        prev.g + matrix.content[i][j]
      end
  end

  def print_trace(sum = 0)
    # puts "i[#{ self.i }][#{ self.j }], val=#{ matrix.content[self.i][self.j] }" \
    #   " g=#{ self.g } f=#{ self.f }"
    if prev.nil?
      puts "sum = #{ sum + matrix.content[self.i][self.j] }"
      return
    end
    prev.print_trace(sum + matrix.content[self.i][self.j])
  end
end

class AStar
  def find_path(matrix, start, goal)
    open_nodes = [Node.new(start[0], start[1])]

    until open_nodes.empty?
      current = open_nodes.min_by { |node| node.f }
      if current.i == goal[0] && current.j == goal[1]
        return current
      end

      # puts
      # (0...matrix.size).each do |i|
      #   (0...matrix.size).each do |j|
      #     if closed_nodes.detect { |node| i == node.i && j == node.j }
      #       print "x"
      #     else
      #       print "-"
      #     end
      #   end
      #   puts
      # end

      open_nodes -= [current]
      closed_nodes << current

      # go left, right, top or bottom
      neighbors = []
      if current.i - 1 >= 0 && closed_nodes_exclude?(current.i - 1, current.j)
        neighbors << Node.new(current.i - 1, current.j)
      end

      if current.j - 1 >= 0 && closed_nodes_exclude?(current.i, current.j - 1)
        neighbors << Node.new(current.i, current.j - 1)
      end

      if matrix[current.i][current.j + 1] && closed_nodes_exclude?(current.i, current.j + 1)
        neighbors << Node.new(current.i, current.j + 1)
      end

      if matrix[current.i + 1] && closed_nodes_exclude?(current.i + 1, current.j)
        neighbors << Node.new(current.i + 1, current.j)
      end

      neighbors.each do |neighbor|
        neighbor.prev = current
        if open_nodes.detect { |node| node.i == neighbor.i && node.j == neighbor.j }.nil?
          open_nodes << neighbor
        end
      end
    end
    puts 'Unable to find path'
  end

  def closed_nodes_exclude?(i, j)
    closed_nodes.detect { |node| node.i == i && node.j == j }.nil?
  end

  def closed_nodes
    @closed_nodes ||= []
  end
end

# input = [
#   [131, 673, 234, 103,  18],
#   [201,  96, 342, 965, 150],
#   [630, 803, 746, 422, 111],
#   [537, 699, 497, 121, 956],
#   [805, 732, 524,  37, 331],
# ]

file  = File.read('project_euler_83_matrix.txt')
input = file.split("\n").map { |row| row.split(',').map(&:to_i) }

m = MatrixAnalyzer.instance
m.content = input
m.set_d
m.set_h

klass = AStar.new
klass.find_path(m.content, [0, 0], [input.size - 1, input.size - 1]).print_trace
