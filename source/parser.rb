module Parser
  def read
    CSV.foreach('todo.csv') do |row|
      file_as_array.push(row)
    end
    file_as_array
  end

  def save_changes
    CSV.open('todo.csv', 'w+') do |csv|
      file_as_array.each do |row_to_convert_for_csv|
        csv << row_to_convert_for_csv
      end
    end
  end
end