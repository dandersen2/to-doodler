require 'pry'
require_relative 'task'

class TaskList
  attr_accessor :all_tasks

  def initialize(new_task_list)
    @all_tasks = new_task_list
    # @owner = username  ?
  end

  def add_task(new_task_string)
    @all_tasks << Task.new({:task_id => @all_tasks.length + 1, :content => new_task_string, :created_at => DateTime.now.to_s, :tags => ["all"] })
  end

  def delete_task(task_number)
    @all_tasks.delete_at(task_number.to_i - 1)
  end

  def check_off_task(task_number)
    @all_tasks[task_number.to_i - 1].completed = "true"
    @all_tasks[task_number.to_i - 1].completed_at = DateTime.now.to_s
  end

  def uncheck_task(task_number)
    @all_tasks[task_number.to_i - 1].completed = "false"
  end

  def to_s
    "\nHere is your To-Doodler list for today:\n" +
    "_______________________________________\n" +
    @all_tasks.map do |task_object|
      task_object
    end.join
  end

# TODOS 2.0 !!!
# _______________________________________

  def outstanding
    outstanding_tasks = @all_tasks.select { |task| !task.completed? }
    outstanding_tasks.sort { |x, y| y.created_at <=> x.created_at }
  end

  def completed
    completed_tasks = @all_tasks.select { |task| task.completed? }
    completed_tasks.sort { |x, y| y.completed_at <=> x.completed_at }
  end

  def sorted
    @all_tasks.sort { |x, y| y.created_at <=> x.created_at }
  end

  def add_tags(task_number, tags)
    tags.each do |tag|
      @all_tasks[task_number.to_i - 1].tags << tag
    end
  end

#This method should iterate through all the inputted tags and delete any tags from the task if they match the current tag (COMPLETED [X])
  def remove_tags(task_number, tags)
    tags.each do |tag|
      @all_tasks[task_number.to_i - 1].tags.delete_if { |current_tag| tags.include?(current_tag) }
    end
  end

#This method should iterate through all the tasks in @all_tasks and return ANY that have ANY of the tags in the tags array argument (COMPLETED [X}])
  def inclusive_filter_by_tags(tags)
    tagged_tasks = @all_tasks.select do |task|
      task.tags.any? { |t| tags.include?(t) }
    end
    tagged_tasks.sort { |x, y| y.created_at <=> x.created_at }
  end

# This method should iterate through all the tasks in @all_tasks and return ONLY the ones that contain ALL of the tags in the tags array. (COMPLETED [X}])
  def exclusive_filter_by_tags(tags)
    tagged_tasks = @all_tasks.select { |task| (tags - task.tags).empty? }
    tagged_tasks.sort { |x, y| y.created_at <=> x.created_at }
  end

end







