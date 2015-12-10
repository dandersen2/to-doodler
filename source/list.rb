require_relative 'task'

class List
attr_accessor :tasks

def initialize
  @tasks = []
end

def add_tasks(task)
  self.tasks << task
end

end
