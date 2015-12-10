require 'csv'
require_relative 'todo.rb'


describe Controller do
  let(:controller) {Controller.new('todo.csv')}

  describe '#run_list' do
    it "displays an array of tasks when user enters'display'" do
      ARGV[0] = 'display'
      expect(controller.parsed_list).to be_a(Array)
    end

    it "displays an array of tasks when user enters'display'" do
      ARGV = "add Walk Dog"
      expect(controller).to change{parsed_list.size}.by(1)
    end
  end
end
