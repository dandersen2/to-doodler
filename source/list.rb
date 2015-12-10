ARGV.inspect
require 'pry'
require 'csv'
require_relative 'task_parser'
require_relative 'task'

class List
  attr_reader :tasks

  def initialize(args={})
    @tasks = args
  end

  def add(task)
    self.tasks << task
    TaskParser.save(self.tasks, 'todo.csv')
  end

  def delete(task_number)
    self.tasks.delete_at((task_number.to_i) - 1)
    TaskParser.save(self.tasks, 'todo.csv')
  end

  def complete(task_number)
    self.tasks[(task_number.to_i) - 1].complete_task
    TaskParser.save(self.tasks, 'todo.csv')
  end

  def to_s
    list_string = ''
    self.tasks.each_with_index do |task,i|
      # binding.pry
      list_string += "#{i+1}. #{task.completed?} #{task}\n"
    end
    list_string
  end
end
