require_relative 'task'

class List
attr_reader :tasks

def initialize(tasks)
  @tasks = []
end

def add_tasks(task)
  self.tasks << task
end

end
