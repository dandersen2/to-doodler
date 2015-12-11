

class View
  def display_welcome_message
    puts 'Hello!'
  end

  def show_task(task_array)
    task_array.each do |task|
    puts task.chore
  end
  end
end
