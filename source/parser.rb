module Parser

  def parse_csv
    CSV.foreach(@file) do |row|
      @task_array << Task.new(row[0])
      # binding.pry
    end
  def save_csv
    CSV.open(@file, "wb") do |save|
      save.each do |hey|
      hey << @task_array
  end
