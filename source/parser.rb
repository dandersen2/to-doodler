require 'csv'
require 'pry'

module Parser

  def read(file)
    parsed_file = []
    CSV.foreach(file) do |row| {parsed_file << row}
    end
  end


#FIX THIS
  # def save
  #   CSV.open("source/todo.csv", "wb") do |csv|
  #     self.list.each do |task|
  #       binding.pry
  #       csv << [task.to_do]
  #     end
  #   end
  # end


end


# TESTER CODE
# x = Parser.new("todo.csv")



#keep in mind that this comes from a hash
