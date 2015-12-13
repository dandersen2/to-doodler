module Parser

 def parse_csv
    CSV.foreach(@file) do |row|
      @task_array << Task.new(row[0])
    end
  end

  def save_csv
    CSV.open(@file, 'wb') do |csv_object|
      @task_array.each do |row_array|
        csv_object << row_array
      end
    end
  end
end
