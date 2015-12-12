class TaskList
attr_accessor :tasks

  def initialize(tasks)
    @tasks = tasks
  end

  def print_tasks
    #this method should display all tasks in the TaskList (DONE [X])
    self.tasks.each_with_index do |task, index|
      p "Index:#{index}. Task_id:#{task.task_id} Task_content:#{task.content}"
    end
  end

  def add_task(task_string)
    #this method should take a string input and add it as a task object to the TaskList (DONE [ ])
    self.tasks << Task.new({content: task_string})
  end

  def delete_task()
    #This method should take a string input and add it as a task
  end

  def check_off_task
  end


end

