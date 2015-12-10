require 'csv'
require_relative 'ListParser'
require_relative 'PrinttoCSV'
require_relative 'controller'

include ListParser
include PrinttoCSV

class Task
attr_reader :task
  def initialize(task)
     # @task = task
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
attr_reader :list

  def initialize(options = {})
    if options.empty?
      @list = build_list
    else
      @list = {}
    end
  end

  def add(task_string)
    @list << Task.new(task_string)
  end

  def delete(list_index)
    @list.delete_at(list_index - 1)
    @list
  end

  def complete(list_index)
    #     !(/^\[X\]/ =~ task).nil? || (/^\[ \]/ =~ task).nil?
    # task
    # gsub
    # completed_task = @list[list_index - 1].task
    # @list[list_index - 1] = Task.new("<complete> " +completed_task)
    # @list

    # completed_task = @list[list_index - 1].task
    @list[list_index-1] = Task.new(@list[list_index-1].task.sub(/^\[ \]/,"[X]"))
    # byebug
     @list

  end

  def to_s
  @list.map.with_index{|task, task_i| "#{task_i + 1}. #{task}"}.join("\n")
  end

  def write_to_file
    print_to_csv(@list)
  end

end




List.new
