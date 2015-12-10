require_relative 'todo'

describe TodoList do
	let(:test_list) {TodoList.new(title: 'test_list')}
	let(:unordered_test_list) {TodoList.new(title: 'unordered_test_list', is_ordered: false)}

	it 'has a title string called "test_list"' do
		expect(test_list.title).to eq('test_list')
	end

	it 'returns the default "true" if it is an ordered list' do
		expect(test_list.is_ordered?).to be true
	end

	it 'returns the default "false" if it is an unordered list' do
		expect(unordered_test_list.is_ordered?).to be false
	end

end