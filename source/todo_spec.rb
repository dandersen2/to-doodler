require_relative 'todo.rb'

describe 'Controller' do
  let(:controller) {Controller.new('todo.csv')}
  describe 'run_list' do
    it "displays list of tasks when user enters 'display'" do
      ARGV[0] = 'display'
      expect(controller).to be_kind_of(Array)
    end
  end
end
