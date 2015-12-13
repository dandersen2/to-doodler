class View
  def introduction
    puts "Hello and welcome to Edward's To-Do list!"
  end

  def user_interface
    puts "Would you like to: Add to your list? Remove a task from your list? Complete an item from your list? Print your list?"
  end

  def remove_index
    puts "Which task would you like to delete? (Please type an integer)"
  end

  def complete_index
    puts "Which task would you like to mark completed? (Please type an integer)"
  end

  def add_task
    puts "What task would you like to add?"
  end

  def show(task_array)
    counter = 1
    task_array.each do
      |x| puts "#{counter} #{x.name}"
      counter += 1
    end
  end

  def input
    @user_input = gets.chomp.downcase
  end
end

