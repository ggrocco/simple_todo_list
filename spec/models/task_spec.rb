# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Task, type: :model do
  subject(:task) { described_class.new(todo: 'Do something...') }

  describe '#create' do
    it 'new are not done.' do
      expect(task.done).to be false
    end
  end

  describe '#Update' do
    let(:user) { build(:user, :with_list_with_task) }
    let(:list) { user.lists.first }
    let(:task) { list.tasks.first }

    it 'Has create notify after change to done' do
      expect do
        task.done = true
        task.save!
      end.to change(list.list_feeds, :count).by(1)
    end
  end
end
