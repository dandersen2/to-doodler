require 'pry'

class List

  attr_accessor :list

  def initialize()
    @list = [] #read("todo.csv")
  end

  def add(task)
    @list << Task.new(task)
  end

  def delete(index) #deletes the task and task number
    @list.delete_at(index-1)
  end

  def complete(index)
    @list[index-1].completed = true
  end

  def to_s
     accumulator = ""
     i = 1
     @list.each do |task|
       accumulator += "#{i}. [#{task.fillblank}] #{task.string_task}\n"
       i += 1
     end
     accumulator
  end

end


