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

  def add(args)
    self.tasks << task
    self.tasks = TaskParser.new(self.tasks, 'todo.csv')
  end

  def delete(task_number)
    self.tasks.delete_at(task_number)
  end

  # def complete(task)
  #   self.tasks.task.completed? = true
  # end

  def to_s
    list_string = ''
    self.tasks.each_with_index do |task,i|
      list_string += "#{i+1}. #{task}\n"
    end
    list_string
  end
end
