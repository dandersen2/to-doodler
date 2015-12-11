require_relative 'todo'
require_relative 'task'


describe Task do

let (:task) {Task.new(task_item: "Take out the trash")}

  describe 'task' do
    it 'should read the new task' do
      expect(task.task_item).to eq "Take out the trash"
    end
  end

end

describe List do

let (:list) {List.new('todo.csv')}

  describe 'task_file' do
    it 'should take in the file passed to the class' do
      expect(list.task_file).to eq ('todo.csv')
    end
  end

  describe 'set_of_tasks' do
    it 'should return an array of task items' do
      expect(list.parse_list_items_from_file.length).to eq 13
    end
  end

  describe 'add_task_to_list' do
    xit 'should add a task to the current array of tasks' do
      list.parse_list_items_from_file
      expect(list.add_task_to_list({task_item: "Take out the trash"}).length).to eq 14
    end
  end

end


