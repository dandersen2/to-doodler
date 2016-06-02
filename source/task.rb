require 'pry'
require 'date'
require_relative 'task_list'

class Task
  attr_reader :task_id, :content, :check_box
  attr_accessor :completed, :created_at, :completed_at, :tags

  def initialize(args = {})
    @task_id = args.fetch(:task_id, 0)
    @completed = args.fetch(:completed, false)
    @content = args.fetch(:content, "")
    @created_at = args.fetch(:created_at, DateTime.now)
    @completed_at = args.fetch(:completed_at, DateTime.now)
    @tags = args.fetch(:tags, ["all"])
    @check_box = checked?
  end

  def completed?
    @completed == "true"
  end

  def checked?
    completed? ? "[X]" : "[ ]"
  end

# WORKING VERSION OF COLORED OUTPUT to_s WITH COMPLETED TASKS IN GREEN, INCOMPLETE TASKS IN MAGENTA, AND TASKS TAGGED AS 'important' IN WHITE
  def to_s
    content_line = "#{@content}"
    until content_line.length == 90
      content_line << " "
    end
    if @task_id.to_i < 10
      if completed?
        task_string = "#{@task_id})  " + " #{@check_box}  " + "#{content_line}" + "#{@created_at.strftime('Created: %m/%d/%Y at %I:%M%p')}    " + "#{@completed_at.strftime('Completed: %m/%d/%Y at %I:%M%p')}   " + "Tags:  #{@tags}"
      else
        task_string = "#{@task_id})  " + " #{@check_box}  " + "#{content_line}" + "#{@created_at.strftime('Created: %m/%d/%Y at %I:%M%p')}    " + "Not completed yet                  " + "Tags:  #{@tags}"
      end
    else
      if completed?
        task_string = "#{@task_id})  " + "#{@check_box}  " + "#{content_line}" + "#{@created_at.strftime('Created: %m/%d/%Y at %I:%M%p')}    " + "#{@completed_at.strftime('Completed: %m/%d/%Y at %I:%M%p')}   " + "Tags:  #{@tags}"
      else
        task_string = "#{@task_id})  " + "#{@check_box}  " + "#{content_line}" + "#{@created_at.strftime('Created: %m/%d/%Y at %I:%M%p')}    " + "Not completed yet                  " + "Tags:  #{@tags}"
      end    end
    if @tags.include?("important")
      task_string.bold.white
    elsif completed?
      task_string.green
    else
      task_string.magenta
    end
  end

end


