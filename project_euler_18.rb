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
          print m[i][j].to_s.rjust(3)
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

  def initialize(i, j, prev = nil)
    @matrix = Matrix.instance

    @i, @j = i, j
    @prev = prev

    set_g
    set_f
  end

  def prev=(node)
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
end

class AStarTriangle
  def find_path
    open_nodes = [Node.new(0, 0)]
      # [Node.new(0, 0), Node.new(1, 0, Node.new(0, 0)), Node.new(1, 1, Node.new(0, 0))]
    closed_nodes = []

    # open_nodes.each do |node|
    #   puts node.g
    #   puts node.f
    #   puts
    # end

    until open_nodes.empty?
      current = open_nodes.max_by { |node| node.f }
      # p current.i
      if current.i == Matrix.instance.content.size - 1
        return current
      end

      open_nodes -= [current]
      closed_nodes << current

      neighbors = [Node.new(current.i + 1, current.j), Node.new(current.i + 1, current.j + 1)]

      neighbors.each do |neighbor|
        neighbor.prev = current
        print "#{ current.f } "
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
  %w[75],
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
  %w[ 4 62 98 27 23  9 70 98 73 93 38 53 60  4 23]
]


m = Matrix.instance
m.content = input
m.output
# m.output(m.h)

klass = AStarTriangle.new
puts
p klass.find_path
