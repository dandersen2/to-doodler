require 'csv'
require_relative 'ListParser'
require_relative 'PrinttoCSV'
require_relative 'controller'

include ListParser
include PrinttoCSV

class Task
attr_reader :task
  def initialize(task)
    @task = add_checkbox(task)
  end

  def add_checkbox(task)
    task = "[ ]  " + task if (/^\[X\]/ =~ task).nil? && (/^\[ \]/ =~ task).nil?
     task
  end

  def to_s
    @task
  end
end

class List
attr_reader :list, :file

  def initialize(file)
    @file = file
    @list = build_list(@file)
  end

  def add(task_string)
    @list << Task.new(task_string)
  end

  def delete(list_index)
    @list.delete_at(list_index - 1)
    @list
  end

  def complete(list_index)
    @list[list_index-1] = Task.new(@list[list_index-1].task.sub(/^\[ \]/,"[X]"))
     @list
  end

  def to_s
  @list.map.with_index{|task, task_i| "#{task_i + 1}. #{task}"}.join("\n")
  end

  def write_to_file
    print_to_csv(@list, @file)
  end

end




# List.new
