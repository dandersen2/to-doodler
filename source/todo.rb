require 'csv'

class Task
  attr_reader :item_number, :task_description
  attr_accessor :complete
  def initialize(task_description, complete = "[]", item_number)
    @item_number = item_number
    @complete = []
    @task_description = task_description
  end

  def to_s
    "#{@item_number}. #{@complete} #{@task_description}"
  end

end

class TaskList

  attr_accessor :list

  def initialize(list= [])
    @list = list
  end

  def display_all_tasks
    puts list
  end

  def add_task(task_description)
    item_number = list.length + 1
    puts list << Task.new(task_description, "[]", item_number)
  end

  def delete_task(task_number_to_delete)
    puts list.delete_if {|task| task.item_number == task_number_to_delete}
  end

  def complete_tasks(task_number_to_complete)
    list.each do |task|
      if task.item_number == task_number_to_complete
        task.complete = "[X]"
      end
    end
  end

   def save_list
    CSV.open('todo.csv', 'wb') do |csv|
      list.each do |task|
        csv << ["#{task.complete} #{task.task_description}"]
      end
    end
  end

end


module ListLoadable
  def self.list_from_csv(filepath)
    list = []
    index = 1
    CSV.foreach(filepath) do |task_item|
        list << Task.new(task_item[0], task_item[1], index)
        index += 1
    end
    list
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
    puts "Welcome to your TODO list!"
    puts "Type: "
    puts "'display' to view list"
    puts "'add' to add item to list"
    puts "'remove' to remove item from list"
    puts "'complete' to complete"
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
      @list.complete(@view.user_args)
    else
      @view.command_options
    end
    @list.save_list
  end


end



controller = Controller.new('todo.csv')



