require_relative 'todo'

describe 'List' do
  let(:list) {save_tasks_to_csv}

  describe 'add'  do
    let(:tasks) {["Win cheeseburger eating competition"]}

    it 'should add the task in a CSV formatted file' do
      expect(tasks[0]).to eq ("Win cheeseburger eating competition")
    end
  end
end

describe CSVParsable do
 let(:tasks) { CSVParsable.get_tasks_from_csv("todo.csv") }

 describe "#get_tasks_from_csv" do
  it "returns an array of To-Do objects" do
    expect ("todo.csv").to include ("Become lead singer of Judas Priest")
  end
end
end

