# require 'parser'

class List

  attr_accessor :list

  def initialize()
    @list = []
  end

  def add(task)
    @list << task
    puts "Appended #{task} to the to-do list"
  end

  def remove(index)
    @list[index].delete
  end



end


