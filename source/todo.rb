require 'csv'

module ListLoadable
  def self.list_from_csv(filepath)
    list = []
    item_num = 1
    CSV.foreach(filepath) do |task|
        task.unshift(item_num)
        if list.size == 3
          list << Task.new(task[0], task[2], task[1])
        else
          list << Task.new(task[0], task[1])
        end
        item_num += 1
    end
    list
  end
end

class Task
  attr_reader :task_description, :item_num, :completion

  def initialize(item_num, task_description, completion = "[ ]")
    @item_num = item_num
    @task_description = task_description
    @completion = completion
  end

  def complete
    @completion = "[X]"
  end

  def incomplete
    @completion = "[ ]"
  end

  def to_s
    if @item_num < 10
      "#{@item_num}.  #{@completion} #{@task_description}"
    else
      "#{@item_num}. #{@completion} #{@task_description}"
    end
  end
end

class TaskList
  attr_reader :list

  def initialize(list = [])
    @list = list
  end

  def display_all
    @list
    save_list_csv
    save_list_txt
  end

  def add_task(task_description)
    item_num = @list.size + 1
    @list << Task.new(item_num, task_description)
    save_list_csv
    save_list_txt
  end

  def remove_task(item_num)
    @list.delete_if{|task| task.item_num == item_num.to_i}
    save_list_csv
    save_list_txt
  end

  def mark_complete(item_num)
    @list.each do |task|
      task.complete if task.item_num == item_num.to_i
    end
    save_list_csv
    save_list_txt
  end

  def mark_incomplete(item_num)
    @list.each do |task|
      task.incomplete if task.item_num == item_num.to_i
    end
    save_list_csv
    save_list_txt
  end

  def save_list_csv
    CSV.open('todo.txt', 'wb') do |csv_line|
      @list.each do |task|
        csv_line << [task.completion, task.task_description]
      end
    end
  end

  def save_list_txt
    File.open('todo.txt', 'wb') do |file_line|
      @list.each do |task|
        file_line << "#{task.item_num}. #{task.completion} #{task.task_description} \n"
      end
    end
  end
end

class View
  def input
    ARGV
  end

  def command
    input[0]
  end

  def command_args
    input[1..-1].join(" ")
  end

  def command_options
    puts "--------------------------"
    puts "Welcome to your TODO list!"
    puts "--------------------------"
    puts "1. 'display' to view list"
    puts "2. 'add' to add item to list"
    puts "3. 'delete' to remove item from list"
    puts "4. 'check' to complete a task"
    puts "5. 'uncheck' to make a task incomplete"
  end
end

class Controller
  include ListLoadable

  def initialize(file)
    @parsed_list = ListLoadable.list_from_csv(file)
    @list = TaskList.new(@parsed_list)
    @view = View.new
    run_list_program
  end

  def run_list_program
    case @view.command
    when "display"
      @list.display_all
    when "add"
      @list.add_task(@view.command_args)
    when "delete"
      @list.remove_task(@view.command_args)
    when "check"
      @list.check_box(@view.command_args)
    when "uncheck"
      @list.uncheck_box(@view.command_args)
    else
      @view.command_options
    end
  end
end

Controller.new('todo.csv')