#I AM JACK's HANDs AND FEET. I AM MADE UP OF DIGIT OBJECTS

require 'pry'

require_relative 'task'

class TaskList
  attr_reader :list, :pretty_print_list # :shovel_back_to_csv
  attr_writer :pretty_print_list # :shovel_back_to_csv

  def initialize
    @list = []
    populate_task_list_from_csv('todo.csv')
    update_csv_file_from_task_list('todo.csv')
    @pretty_print_list = []
    @shovel_back_to_csv = []
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

  def update_csv_file_from_task_list(file)
    counter = 1
    shovel_back_to_csv = []
    list.map do |task|
      if task.completed
      # if task.list.completed
        if counter < 10
          shovel_back_to_csv << (counter.to_s + ".  [X]  " + task.task_content)
        else
          shovel_back_to_csv << (counter.to_s + ". [X]  " + task.task_content)
        end
      else
        if counter < 10
          shovel_back_to_csv << (counter.to_s + ".  [ ]  " + task.task_content)
        else
          shovel_back_to_csv << (counter.to_s + ". [ ]  " + task.task_content)
        end
      end
      counter += 1
    end
    # shovel_back_to_csv.each do |item|
    #   p item
    CSV.open(file, 'w') do |csv|
      csv << [shovel_back_to_csv]
    end
  end

  # def update_csv_file_from_task_list(file)
  #   self.pretty_print_list.map do |item|

  #     # csv_file = CSV.open(file, 'w') do |row|
  #       row << item
  #     end
  #   end
  # end



  # def update_csv_file_from_task_list(file)
  #   csv_file = CSV.open(file, 'w') do |row|
  #     list.map do |task|
  #       # row << task.task_content
  #       row << self.list.task.task_content
  #     end
  #   end
  # end

#   CSV.open('our-new-customers-file.csv', 'w') do |csv_object|
#   customers.array.each do |row_array|
#     csv_object << row_array

  def tasks(task_list_name)
    to_s
  end

  def to_s
    counter = 1
    list.map do |task|
      if task.completed
      # if task.list.completed
        if counter < 10
          self.pretty_print_list << (counter.to_s + ".  [X]  " + task.task_content)
        else
          self.pretty_print_list << (counter.to_s + ". [X]  " + task.task_content)
        end
      else
        if counter < 10
          self.pretty_print_list << (counter.to_s + ".  [ ]  " + task.task_content)
        else
          self.pretty_print_list << (counter.to_s + ". [ ]  " + task.task_content)
        end
      end
      counter += 1
    end
    self.pretty_print_list.each do |item|
      p item
    end

  end

end

#my_todo_list.list.task[0].task_id   gets the content within the task object

# def combine_checkbox_and_content
#     [self.completed, self.task_id, self.task_content]
# end
