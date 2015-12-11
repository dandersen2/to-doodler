#I AM JACK's HANDs AND FEET. I AM MADE UP OF DIGIT OBJECTS

require 'pry'

require_relative 'task'

class TaskList
  attr_reader :list

  def initialize
    @list = []
    populate_task_list_from_csv('todo.csv')
  end

  def add(task_string)
    new_task_object= Task.new(task_string)
    self.list << new_task_object
    task_string
  end

  def delete(task_id)
    self.list.each do |task_object|
      if task_object.task_id == task_id
       list.delete(task_object)
      end
    end
    "task_id #{task_id} has been deleted"
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
    csv_file = CSV.open(file).map do |row|
    self.list << Task.new(row[0])
    end
  end

  def tasks(task_list_name)
    to_s
  end

  def to_s
    counter = 0
    list.map do |task|
    # self.list.list.map do |task|
      # p task
      # p task.task_content
      # p task.task_id
      # p task.completed
      # binding.pry
      if task.completed
      # if task.list.completed
        p counter.to_s + "[X]" + task.task_content
      else
        p counter.to_s + "[ ]" + task.task_content
      end
      counter += 1
    end
  end
  # def to_s
  #   counter = 0
  #     @list.map do |task|
  #       # task.map do |attribute|???
  #   # @list.map do |task|
  #     if task.completed
  #       counter + "[X]" + task.task_content
  #     else
  #       counter + "[ ]" + task.task_content
  #       # " #{self.counter} [X]" + task
  #     end
  #     counter += 1
  #   end
  # end

end

#my_todo_list.list.task[0].task_id   gets the content within the task object

# def combine_checkbox_and_content
#     [self.completed, self.task_id, self.task_content]
# end
