require 'pry'
require_relative 'colored'

class View

  def display(output)
    puts output
  end

  def start_menu
    display("\nWelcome to To-Doodler!
      Enter '1' or 'list'  to see your current To-Do list
      Enter '2' or 'add' followed by the To-Do item, to add a new To-Do to your list.
      Enter '3' or 'delete' followed by the To-Do item number to delete a To-Do from your list.
      Enter '4' or 'check' followed by the To-Do item number to check off a To-Do on your list.
      Enter '5' or 'uncheck' followed by the To-Do item number to uncheck a To-Do on your list.
      Enter '6' or 'outstanding' to view all incomplete items on your list, most recent first.
      Enter '7' or 'completed' to view all completed items on your list, most recent first.
      Enter '8' or 'sorted' to view all items on your list, most recent first.
      Enter '9' or 'add-tag' or 'add-tags' followed by the To-Do item number followed by the tag or tags to add tags.
      Enter '10' or 'inclusive-filter' followed by the tag or tags (separated by a space) to see all tasks that have that tag or tags.
      enter '11' or 'exclusive-filter' followed by multiple tags separated by spaces to see ONLY the to-do's that contain ALL of those tags
      Enter '12' or 'remove-tag' or 'remove-tags' followed by a task number followed by the tag or tags to remove tags from a task.
      Enter 'exit' to quit To-Doodler
      ".bold.yellow)
  end

  def get_user_input
    input = gets.chomp.split(" ")
    if input[0] == "add-tag" || input[0] == "add-tags" || input[0] == "9"
      {command: input.shift, task_item: input.shift, tags: input[0..-1]}
    elsif input[0] == "remove-tag" ||  input[0] == "remove-tags" || input[0] == "12"
      {command: input.shift, task_item: input.shift, tags: input[0..-1]}
    elsif input[0] == "inclusive-filter" || input[0] == "10" || input[0] == "exclusive-filter" || input[0] == "11"
      {command: input.shift, tags: input[0..-1]}
    else
      {command: input.shift, task_item: input.join(" ")}
    end
  end

end
