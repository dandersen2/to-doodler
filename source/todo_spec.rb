
#require_relative 'task'
require_relative 'todo'



describe 'ToDo' do
    let(:jessies_list) {ToDo.new("test_csv.csv")}
     describe '#task_array' do
    it "expects task_array to return an array" do
      expect(jessies_list.file).to be readable
    end
  end
end
