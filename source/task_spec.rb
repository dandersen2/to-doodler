require_relative 'task'

describe Task do
  let(:task_1){Task.new(item: "Move with Lil to the black mountain hills of Dakota", status: "Pending")}

  describe '#item' do
    it 'should return the item text' do
      expect(task_1.item).to eq("Move with Lil to the black mountain hills of Dakota")
    end
  end

  describe '#status' do
    it 'should return the status of the task' do
      expect(task_1.status).to eq("Pending")
    end
  end

end

