class View

  def print_out(print)
    puts print
  end

  def intro_message
    puts "HELLO THIS IS YOUR TO DO MAKER" +"\n"+ "PRESS (1) TO MODIFY AN EXISTING LIST OR (2) TO START A NEW ONE OR (EXIT) TO EXIT"
  end

  def add_file_message
    puts "PLEASE ADD FILE PATH"+"\n"
  end

  def gets_input
    input = gets.chomp
  end

  def error_message
    puts "\n"+"ERROR: WRONG INPUT PLEASE TYPE A VALID INPUT"
    puts "\n"
  end

  def add_task_message
    puts "\n"+"PLEASE ADD A TASK"
  end

  def delete_task_message
    puts "\n"+"PLEASE CHOOSE TASK TO DELETE"
  end

  def complete_task_message
    puts "\n"+"PLEASE CHOOSE COMPLETED TASK"
  end

  def repeat_message
    puts "\n"+"WOULD YOU LIKE TO DO ANYTHING ELSE?"
  end

  def options_intro_message
    puts "HELLO WE NOW HAVE A TODO LIST"
    puts "WHAT WOULD YOU LIKE TO DO:"
  end

  def options_message
    puts "TYPE ANY OF THE FOLLOWING OPTIONS:"
    puts "\n"
    puts "(ADD) TO ADD TO YOUR TODO LIST"
    puts "(DELETE) TO DELETE FROM YOUR TODO LIST"
    puts "(COMPLETE) TO COMPLETE A TASK FROM YOUR TODO LIST"
    puts "(PRINT) TO PRINT YOUR TODO LIST"
    puts "(STORE) TO SAVE YOUR TODO LIST TO A FILE"
    puts "(EXIT) TO EXIT PROGRAM"
  end

  def options_end_message
    puts "WOULD YOU LIKE TO DO ANYTHING ELSE?(ADD/DELETE/COMPLETE/PRINT/STORE) IF NOT TYPE(EXIT)"
  end

  def list_title
    puts "--------TODO LIST------"
  end

  def space
    puts "\n"
  end
end
