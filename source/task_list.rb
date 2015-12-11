#I AM JACK's HANDs AND FEET. I AM MADE UP OF DIGIT OBJECTS

require 'pry'

# require_relative 'task_parser'
require_relative 'task'

class TaskList
  attr_reader :list

  def initialize #(args = )
    @list = []
    populate_task_list_from_csv('todo.csv')
    # @list = args.fetch(:list, [])
    # @length
    # @counter = 1
  end

  def add(task_string)
    new_task_object= Task.new(task_string)
    self.list << new_task_object
    task_string
    #refactor and combine these 2 lines!
  end

  def delete(task_id)
    self.list.each do |task_object|
      if task_object.task_id == task_id
       list.delete(task_object)
      end
    end
    "task_id #{task_id} has been deleted"
    #deleted the task with the given task_id from the task list named task_list_name
  end

  def complete(task_id)
    self.list.each do |task_object|
      if task_object.task_id == task_id
       task_object.completed = true
      end
    end
  end

  def length
    @length = @list.length
  end

  def populate_task_list_from_csv(file)
    # Returns an array of Todo objects from todo.csv
    csv_file = CSV.open(file).map do |row|
    # csv_file = CSV.open(file).map do |row|
    self.list << Task.new(row[0])
    # self.list << Task.new ({task_content: row[0], task_id: rand.to_s[2..6].to_i})
    #   # binding.pry
    #   self.parsed_list << row[0]
    #   # self.parsed_list << ToDo.new(row)

    # end
    # self.parsed_list.each do |task_content_string|
    #   self.list << Task.new({task_content: task_content_string, task_id: rand.to_s[2..6].to_i})
    end
    # binding.pry
    # (use this to check what is being shoveled into @parsed_list)
  end

  def tasks(task_list_name)
    to_s
    #prints all tasks in this task_list

  end

  def to_s
    counter = 0
      @list.map do |task|
        # task.map do |attribute|???
    # @list.map do |task|
      if task.completed
        counter + "[X]" + task.task_content
      else
        counter + "[ ]" + task.task_content
        # " #{self.counter} [X]" + task
      end
      counter += 1
    end
  end

end

#my_todo_list.list.task[0].task_id   gets the content within the task object



# def combine_checkbox_and_content
#     [self.completed, self.task_id, self.task_content]
# end

# def to_s
#     "#{@task_content}"
#   end

