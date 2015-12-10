require 'pry'
require 'csv'
require_relative 'task'
require_relative 'list'


module TaskParser
  def self.save(tasks_list, file)
    CSV.open(file, 'wb') do |csv|
      tasks_list.each do |task|
        binding.pry
        if task.completed? == '[ ]'
          csv << [task.completed?] + [task.to_s]
        end
      end
    end
  end

  def self.parse(file)
    CSV.read(file, 'a+').map { |task_row|
      # binding.pry
      Task.new(task_row[0]) }
  end
end
