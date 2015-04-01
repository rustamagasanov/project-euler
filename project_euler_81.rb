require 'singleton'

# Heuristic is unnecessary for this task
class Matrix
  include Singleton
  attr_accessor :content

  def output(m = content)
    (0...m.size).each do |i|
      puts if i > 0
      (0...m.size).each do |j|
        if m[i][j].nil?
          break
        else
          print m[i][j].to_s.rjust(5)
        end
      end
    end
    puts
  end

  def h
    if @h.nil?
      @h = []
      (0...content.size).each do |i|
        d = []
        (0..i).each do |j|
          d << i #input.size - 1 - i
        end
        @h[i] = d
      end
    end
    @h
  end
end

class Node
  attr_reader :i, :j, :matrix, :prev, :g, :f

  def initialize(i, j, prev_node = nil)
    @matrix = Matrix.instance

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
    @f = g.to_i + matrix.h[i][j].to_i
  end

  def set_g
    @g =
      if prev.nil?
        matrix.content[i][j].to_i
      else
        prev.g + matrix.content[i][j].to_i
      end
  end

  def print_trace
    return if prev.nil?
    prev.print_trace
    puts "i[#{ self.i }][#{ self.j }], g=#{ self.g }"
  end
end

class AStarTriangle
  def find_path
    open_nodes = [Node.new(0, 0)]
    closed_nodes = []

    until open_nodes.empty?
      current = open_nodes.max_by { |node| node.f }
      if current.i == Matrix.instance.content.size - 1
        return current
      end

      open_nodes -= [current]
      closed_nodes << current

      neighbors = [Node.new(current.i + 1, current.j), Node.new(current.i + 1, current.j + 1)]

      neighbors.each do |neighbor|
        neighbor.prev = current
        unless open_nodes.include?(neighbor)
          open_nodes << neighbor
        end
      end
    end
    puts 'Unable to find path'
  end

  # private
  def related_nodes
  end
end

input = [
  [131, 673, 234, 103,  18],
  [201,  96, 342, 965, 150],
  [630, 803, 746, 422, 111],
  [537, 699, 497, 121, 956],
  [805, 732, 524,  37, 331],
]


m = Matrix.instance
m.content = input
m.output
# m.output(m.h)

# klass = AStarTriangle.new
# node = klass.find_path
# node.print_trace
