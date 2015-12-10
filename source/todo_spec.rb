require_relative 'todo.rb'
describe Tasks do
  let(:task_string) {"Visit doctor"}
  let(:new_task) {Task.new(task_string)}

  describe '#initialize' do
    it 'should create a string' do
      expect(new_task.task).to eq (task_string)
    end
  end

  describe '#to_s' do
    it 'should print "Visit doctor"' do
      expect(new_task.to_s).to eq(task_string)
    end
  end

end


describe List do
  let(:todo) {List.new}
  let(:my_task) {"Visit doctor"}

  describe '#initialize' do
    it 'should create an array' do
      expect(todo.list).to eq ([])
    end
  end

  describe '#add' do
    it 'should add task "Visit doctor"' do
      todo.add(my_task)
      expect(todo.list.first.task).to eq(my_task)
    end
  end

  describe '#delete' do
    it 'should delete "Visit doctor task' do
      todo.add(my_task)
      todo.delete(1)
      expect(todo.list.length).to eq(0)
    end
  end

  describe '#complete' do
    it 'should mark "Visit doctor" as complete' do
      todo.add(my_task)
      todo.complete(1)
      expect(todo.list.first.task).to eq("<complete> " + my_task)
    end
  end

  describe '#to_s' do
    it 'should print "Visit doctor' do
      todo.add(my_task)
      expect(todo.to_s).to eq("1. " + my_task)
    end
  end
end

describe Controller do
  let(:args) {["delete", 1]}

  describe '#list' do
  end



end

