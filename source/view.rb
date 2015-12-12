# Parse the command-line arguments and take the appropriate action  ???
# 2. Displaying information to the user (view)
class View
  # def initialize(args) #ARGV from terminal "add" "delete" "complete" etc.
# attr_reader :start_menu
  # end
  # def initialize(input)
  #   # @command = input.shift
  #   # @item = input
  # end

  def display(output)
    # binding.pry
    puts output
  end

  def display_list(task_objects)
 # this should be a to_s method to print , but the VIEW should be doing the printing!
    #this method should display all tasks in the TaskList (DONE [X])
    task_objects.each_with_index do |task, index|
      if index < 9
        puts "#{index + 1}.  #{task.completed?} #{task.content}" #{task.task_id}
      else
        puts "#{index + 1}. #{task.completed?} #{task.content}" #{task.task_id}
      end
    end
  end

  def get_user_input
    # input = ""
    input = gets.chomp.split(" ")
    parsed_input = {command: input.shift, task_item: input.join(" ")}
    # command = input.shift
    # item = input
    # input =
    # "You have entered: #{input}"
    # input
  end

  def start_menu
    display("Welcome to To_Doodler!
      Enter 'list' to see your current To-Do list
      Enter 'add' followed by the To-Do item, to add a new To-Do to your list.
      Enter 'delete' followed by the To-Do item to delete a To-Do from your list.
      Enter 'completed' followed by the To-Do item to check off a To-Do on your list.
      ")
  end

end
