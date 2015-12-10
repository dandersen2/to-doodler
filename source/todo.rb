require 'csv'
require 'date'
module ListLoadable
  def self.list_from_csv(filepath)
    list = []
    index = 1

    CSV.foreach(filepath) do |task_item|
        date= DateTime.now
        list << Task.new(task_item[0], task_item[1], index, date)
        index += 1
    end
    list
  end
end


class Task
  attr_reader :task_description,  :date
  attr_accessor :complete, :item_number

  def initialize(task_description, complete, item_number, date)
    @item_number = item_number
    @complete =  complete || false
    @task_description = task_description
    @date = DateTime.now
  end


  def to_s
    "#{@item_number}. #{@complete} #{@task_description}    Created at: #{@date}"
  end
end

class TaskList

  attr_reader :list

  def initialize(list= [])
    @list = list
  end

  def display_all_tasks
    puts list
  end

  def add_task(task_description)
    item_number = list.length + 1
    date = DateTime.now
    puts list << Task.new(task_description, "[ ]", item_number, date)
  end

  def delete_task(task_number_to_delete)
    puts list.reject! {|task| task.item_number == task_number_to_delete.to_i}
  end

  def complete_tasks(task_number_to_complete)
    list.each do |task|
      if task.item_number == task_number_to_complete.to_i
        task.complete = true
      end
    end
  end

  def sort
    list.sort_by {|task| task.date}
  end

  def save_list
    CSV.open('todo.csv', 'wb') do |csv|
      list.each do |task|
        csv << ["#{task.task_description}"]
      end
    end
  end

end




class View
  def input
    ARGV
  end

  def initial_command
    input[0]
  end

  def user_args
    input[1..-1].join(" ")
  end

  def command_options
    puts "--------------------------"
    puts "Welcome to your TODO list!"
    puts "--------------------------"
    puts "1. 'display' to view list"
    puts "2. 'add' to add item to list"
    puts "3. 'remove' to remove item from list"
    puts "4. 'check' to complete a task"
    puts "5. 'sort' to sort by date"
  end

end





class Controller
  include ListLoadable

  def initialize(file)
    @parsed_list = ListLoadable.list_from_csv(file)
    @list = TaskList.new(@parsed_list)
    @view = View.new
    run_list
  end

  def run_list

    case @view.initial_command
    when "display"
      @list.display_all_tasks
    when "add"
      @list.add_task(@view.user_args)
    when "remove"
      @list.delete_task(@view.user_args)
    when "check"
      @list.complete_tasks(@view.user_args)
    when "sort"
      @list.sort
    else
      @view.command_options
    end
    @list.save_list
  end

end

Controller.new('todo.csv')
