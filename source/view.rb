class View

  def print_out(print)
    puts print
  end

  def intro_message
    puts "HELLO THIS IS YOUR TASK MANAGER PRESS (1) TO MODIFY AN EXISTING LIST OR (2) TO START A NEW ONE"
  end

  def add_file_message
    puts "PLEASE ADD FILE PATH"
  end

  def gets_input
    input = gets.chomp
  end

  def error_message
    puts "ERROR: WRONG INPUT PLEASE INPUT (1) OR (2)"
  end

  def add_task_message
    puts "PLEASE ADD A TASK"
  end

  def delete_task_message
    puts "PLEASE CHOOSE TASK TO DELETE"
  end

   def complete_task_message
    puts "PLEASE CHOOSE COMPLETED TASK"
  end

end
