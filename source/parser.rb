require 'pry'
module Parsater
  task_list = []

  def parse_csv(file)
    counter = 1
    CSV.foreach(file) do |task|
        task_list << Task.new(task.join.chomp,counter)
        counter +=1
    end
  end

  def save_csv(list)
    CSV.open("Todo_List.csv", "wb") do |csv|
      list.each do |list_element|
        csv << [list_element]
      end
    end
  end
end
