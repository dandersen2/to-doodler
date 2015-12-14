class TaskList
include CsvParser
attr_accessor :tasks

  def initialize(tasks = "")
    @tasks = tasks
   end

   #Printable_list should be here, not in the view!!!

  def print_tasks
    @tasks
  end

  def add_task(task_string)
    self.tasks << Task.new({task_id: (tasks.length + 1), completed: false, content: task_string})
  end

  def delete_task(task_string)
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

  def to_s
  # ? I'm not sure where the proper place for this is with my current MVC setup?
  # output task_id + content + completed? (DONE [ ])
  end
end
