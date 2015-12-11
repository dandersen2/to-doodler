require 'csv'
require 'pry'
require_relative 'task'


class List

attr_reader :task_file
attr_writer :set_of_tasks

  def initialize(task_file)
    @task_file = task_file
    @set_of_tasks = []
    @set_of_tasks += parse_list_items_from_file
  end


  def parse_list_items_from_file
    CSV.foreach(@task_file).map{|row| Task.new({:task_item => row[0]}).to_s}
  end


  def action
    case
      when ARGV[0] == "list" then self.display_list
      when ARGV[0] == "delete" then self.delete_list_item
      when ARGV[0] == "add" then self.add_list_item
    end
  end


  def display_list
      @set_of_tasks.each_with_index {|item, index| puts "#{index + 1}. #{item}"}
  end


  def add_list_item
    new_item = []
    new_item << ARGV[1..-1].join(" ")
    CSV.open('todo.csv', 'a') {|csv| csv << new_item}
  end

  def delete_list_item
    @set_of_tasks.each_with_index do |task, index|
      if ARGV[1] == (index + 1)
          @set_of_tasks.delete_at(index)
      end
    end
    CSV.open('todo.csv', 'w') {|csv| csv << @set_of_tasks}
  end
end












