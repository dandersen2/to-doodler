require 'pry'
require 'csv'
require_relative 'parser'

class List
  attr_reader :file, :task_list
  attr_accessor :num_of_tasks

  include Parsater

  def initialize(file = "")
    @file = file
    @task_list = []
    @num_of_tasks = 0
  end

  def list_tasks
    list = []
    @task_list.each do |list_element|
      list << list_element.to_s
    end
  end

  def parse_tasks_from_file
      @task_list << parse_csv(@file)
      @num_of_tasks = (task_list.length-1)
  end

  def add_task(task)
    @task_list << Task.new(task,@num_of_tasks+1)
  end

  def delete_task(task)
    @task_list.delete_if {|list_element| list_element.task.downcase == task }
  end

  def complete_task(task)
    @task_list.each do |list_element|
      list_element.complete ="[x]" if list_element.task.downcase==task
    end
  end

  def save_list
    list = self.list_tasks
    save_csv(list)
  end

  def to_s
    @task_list.each do |task|
      task.to_s
    end
  end

end

class Task
  attr_reader :task, :num
  attr_accessor :complete

  def initialize(task,num="")
    @complete = "[ ]"
    @task = task
    @num = num
  end

  def to_s
    "#{num}.#{task},#{complete}"
  end
end
