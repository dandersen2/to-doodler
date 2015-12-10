class View

  def display(output)
    puts output
    end

  def get_input
    gets.chomp
  end

  def display_message
    puts "    -----------TO DO LIST----------
    \"list\" displays your to-do list
    \"quit\" quits the program
    \"add <task>\" adds a task
    \"delete <id>\" deletes a task
    "
  end

end
