class TaskList
attr_accessor :tasks

  def initialize(tasks)
    @tasks = tasks
    # @tasks = []

  end

def print_tasks
  @tasks
end

 #  def print_tasks
 # # this should be a to_s method to print , but the VIEW should be doing the printing!
 #    #this method should display all tasks in the TaskList (DONE [X])
 #    @tasks.each_with_index do |task, index|
 #      if index < 9
 #        puts "#{index + 1}.  #{task.completed?} #{task.content}" #{task.task_id}
 #      else
 #        puts "#{index + 1}. #{task.completed?} #{task.content}" #{task.task_id}
 #      end
 #    end
 #  end

  def add_task(task_string)
    #this method should take a string input and add it as a task object to the TaskList (DONE [ ])
    self.tasks << Task.new({content: task_string})
  end

  def delete_task(task_string)
    #This method should take a string input and add it as a task
    self.tasks.each do |task|
      if task.content == task_string
        self.tasks.delete(task)
      end
    end
  end

  def check_off_task(task_string)
    self.tasks.each do |task|
      if task.content == task_string
        task.completed = true
      end
    end
  end


end

