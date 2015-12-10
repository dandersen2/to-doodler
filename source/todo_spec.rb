require_relative 'todo'


describe TaskParser do
end

describe List do
  let(:my_list) { List.new }

  it 'is a class that can be initialized' do
    expect{List.new}.to_not raise_error
  end

  describe '#tasks' do
    it 'is readable' do
      expect(my_list.tasks).to eq ([])
    end
  end
end

describe Task do
  it 'is a class and can be initialized' do
    expect{Task.new('a new task')}.to_not raise_error
  end

  let(:my_task) { Task.new('walk dog') }

  describe '#completed?' do
    it 'defaults to false' do
      expect(my_task.completed?).to eq false
    end
  end
end
