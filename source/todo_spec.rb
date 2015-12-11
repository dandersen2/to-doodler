require_relative 'List.rb'

describe Task do
  let(:task_string) {"Visit doctor"}
  let(:checkbox_task) {add_checkbox("Visit doctor")}
  let(:new_task) {Task.new(task_string)}

  describe '#initialize' do
    it 'should create an object with a string and checkbox' do
      expect(new_task.task).to eq ("[ ]  " + task_string)
    end
  end

  describe '#add_checkbox' do
    it 'should add a tick box to the task string' do
      expect(add_checkbox(task_string)).to eq ("[ ]  " + task_string)
    end
  end

  describe '#to_s' do
    it 'should print "Visit doctor"' do
      expect(new_task.to_s).to eq("[ ]  " + task_string)
    end
  end

end


describe List do
  let(:todo) {List.new('todo.csv')}
  let(:my_task) {"Visit doctor"}

  describe '#initialize' do
    it 'should create an array of length 13' do
      expect(todo.list.length).to eq (13)
    end
  end

  describe '#add' do
    it 'should add task "Visit doctor"' do
      todo.add(my_task)
      expect(todo.list.last.task).to eq("[ ]  " + my_task)
    end
  end

  describe '#delete' do
    it 'should change list length to 12 tasks' do
      todo.delete(13)
      expect(todo.list.length).to eq (12)
    end
  end

  describe '#complete' do
    it 'should mark "Visit doctor" as complete' do
      todo.add(my_task)
      todo.complete(14)
      expect(todo.list[14].task).to eq("[X]  " + my_task)
    end
  end

  describe '#to_s' do
    it 'should print "Visit doctor' do
      todo.add(my_task)
      expect(todo.to_s).to eq("1. " + my_task)
    end
  end
end



