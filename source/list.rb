require 'pry'
require 'csv'

class List
  attr_reader :file, :task_list

  def initialize(file = "")
    @file = file
    @task_list = []
  end

  def task_listing
    list = []
    @task_list.each do |list_element|
      list << list_element.to_s
    end
    list
  end

  def parse_tasks_from_file
    CSV.foreach(@file) do |task|
      # binding.pry
      @task_list << Task.new(task)
    end
  end

  def add_task(task)
    @task_list << Task.new(task)
  end

  def delete_task(task)
    @task_list.delete_if {|list_element| list_element.task == task }
  end

  def complete_task(task)
    @task_list.each do |list_element|
      list_element.complete ="[x]" if list_element.task==task
    end
  end

  def to_s
    p "----TODO LIST-----"
    @task_list.each do |task|
      # binding.pry
      task.to_s
    end
    p "------------------"
  end

end

class Task
  attr_reader :task
  attr_accessor :complete

  def initialize(task)
    @complete = "[ ]"
    @task = task
  end

  def to_s
    p "#{task},#{complete}"
  end
end
