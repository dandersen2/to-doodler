
module ListParser
  attr_reader :file

  def build_list(file)
    @list = parse_tasks_from_file(file)
  end

  def parse_tasks_from_file(file)
    list_array = []
    CSV.foreach(file) do |tasks|
      # byebug
      tasks.first.sub!(/^\d+.\s/,"")
      list_array << Task.new(tasks.join)
    end
    list_array
  end
end

