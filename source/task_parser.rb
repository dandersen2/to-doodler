require 'pry'
require 'csv'
require_relative 'task'
require_relative 'list'


module TaskParser
  def self.save(tasks_list, file)
    tasks_list.each do |task|
      CSV.open(file, 'a+') do |csv|
        csv << task
      end
    end
    tasks_list
  end

  def self.parse(file)
    CSV.read(file, 'a+').map { |task_row| Task.new(task_row[0]) }
  end
end

# TaskParser.parse("some_file.csv")
# assuming this returns an array of task objects
# and assuming we are going to pass those in as we instantiate a list object
# where should we be calling this line?
# A: Wherever we're instantiating the new list... in this case in the controller

