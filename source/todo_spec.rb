require_relative 'todo'

describe TodoList do
	let(:test_list) {TodoList.new(path: 'todo.csv')}
	let(:unordered_test_list) {TodoList.new(path: 'unordered_test_list', is_ordered: false)}

	it 'has a path string called "test_list"' do
		expect(test_list.path).to eq('todo.csv')
	end

	it 'returns the default "true" if it is an ordered list' do
		expect(test_list.is_ordered?).to be true
	end

	it 'returns the default "false" if it is an unordered list' do
		expect(unordered_test_list.is_ordered?).to be false
	end

	describe '#complete_task' do
		it 'changes the task\'s "is_complete" boolean to true' do
			test_list.complete_task(1)
			expect(test_list.tasks_todo[0].is_complete?).to be true
		end
	end

end

describe TodoListTask do
	let(:test_task) {TodoListTask.new(descrip: 'a task to do', num: 1)}

	describe '#complete_task' do
		it 'changes the "is_complete" boolean to true' do
			expect(test_task.complete_task).to be true
		end
	end
end

describe Controller do
	let(:test_controller) {Controller.new}
	let(:task_1_complete?) {test_controller.rockys_list.tasks_todo[0].is_complete?}

	describe '#complete_task' do
		it 'changes the "is_complete" boolean of the task to true' do
			test_controller.complete_task(0)
			expect(task_1_complete?).to be true
		end
	end

end