class View

    def introduction
      puts "Hello and welcome to Edward's To-Do list!"
    end

    def user_interface
      puts "Would you like to: Add to your list? Remove a task from your list? Complete an item from your list? Print your list?"
    end
    def remove_index
      p "Which task would you like to delete? (Please type an integer)"
    end

    def complete_index
      p "Which task would you like to mark completed? (Please type an integer)"
    end
    def add_task
      p "What task would you like to add?"
    end
    def show(task_array)
      task_array.each {|x| puts x.name}
    end

end

