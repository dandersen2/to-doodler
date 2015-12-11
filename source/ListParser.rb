
module ListParser
  attr_reader :file

  def build_list
    @list = parse_tasks_from_file
  end

  def parse_tasks_from_file
    list_array = []
    CSV.foreach('todo.csv') do |tasks|
      # byebug
      tasks.first.sub!(/^\d+.\s/,"")
      list_array << Task.new(tasks.join)
    end
    list_array
  end
end

