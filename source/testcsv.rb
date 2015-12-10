require 'csv'

test = []

CSV.foreach('todo.csv') do |row|
  test << row.join(' ') # Use #join in case of in-line comma
end
p test

CSV.open('todo.csv', 'a') do |file|
  test.each{|row| file << [row]}
end

