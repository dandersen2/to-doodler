require 'pry'
class View

  attr_reader :printable_list

  def initialize
    @printable_list = []
  end

  def display(output)
    puts output
  end

  def display_list(list_as_string)
    puts list

    # puts "Here is your current to do list:"
    # # binding.pry
    # task_objects.each_with_index do |task, index|
    #   if index < 9
    #     puts "#{task.task_id}.  #{task.completed} #{task.content}"
    #     # puts "#{index + 1}.  #{task.completed?} #{task.content}"
    #     # self.printable_list << [task.content]
    #     self.printable_list << [task.task_id, task.completed, task.content]
    #   else
    #     puts "#{task.task_id}. #{task.completed} #{task.content}"
    #     # puts "#{index + 1}. #{task.completed?} #{task.content}"
    #     # self.printable_list << [task.content]
    #     self.printable_list << [task.task_id, task.completed, task.content]
    #   end
    # end
    # puts
    # printable_list
  end

  def get_user_input
    input = gets.chomp.split(" ")
    {command: input.shift, task_item: input.join(" ")}
  end

  def start_menu
    display("Welcome to To-Doodler!
      Enter 'list' to see your current To-Do list
      Enter 'add' followed by the To-Do item, to add a new To-Do to your list.
      Enter 'delete' followed by the To-Do item to delete a To-Do from your list.
      Enter 'completed' followed by the To-Do item to check off a To-Do on your list.
      Enter 'exit' to quit To-Doodler
      ")
  end

end
