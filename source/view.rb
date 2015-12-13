
class View

  def get_input
    gets.chomp
  end

  def display_output(message)
    puts message
  end

  def display_list(task, index)
    display_output("#{index}. #{task}")
  end

  def add_item(task)
    puts "You have added #{task} to your TODO list"
  end

  def delete_item(task)
    puts "You have removed #{task} from your TODO list"
  end

  def no_input
    puts "Sorry, that is not a valid request"
  end

end
