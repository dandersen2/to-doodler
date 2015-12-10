require_relative 'task'

class List
attr_accessor :tasks

def initialize
  @tasks = []
end

def add_task(task)
  self.tasks << task
end

end
