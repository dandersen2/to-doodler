# requires ALL files that interact
require_relative 'csv_parser'
require_relative 'task'
require_relative 'task_list'

# here include csv_parser module
include CsvParser

parsed_list = CsvParser.csv_parse('todo.csv')

new_task_list = TaskList.new(parsed_list)

# p new_task_list

new_task_list.print_tasks                       #(WORKING [X])

new_task_list.add_task("buy some bananas")      #(WORKING [X])
new_task_list.print_tasks

new_task_list.print_tasks

# new_task_list.delete_task("Visit doctor")         #(WORKING [ ])
# new_task_list.print_tasks

# Parse the command-line arguments and take the appropriate action

