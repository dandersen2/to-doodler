require_relative 'list'

describe List do
  let(:list_1){List.new}

  describe '#tasks' do
    it 'should return all tasks in the list' do
      expect(list_1.tasks).to eq([])
    end
  end

  describe '#add_tasks' do
    it 'should return the status of the task' do
      task = {:item=>"Move with Lil to the black mountain hills of Dakota", :status=>"Pending"}
      expect{list_1.add_task(task)}.to change{list_1.tasks.length}.by(1)
    end
  end

end


