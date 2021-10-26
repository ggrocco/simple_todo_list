# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ListFeed, type: :model do
  subject(:list_feed) { described_class.new(builder: FeedBuilders::TaskDone.new(task_id: 12), list: create(:list)) }

  describe '#create' do
    it 'Is valid with valid arguments' do
      expect(list_feed.builder).to be_instance_of FeedBuilders::TaskDone
    end

    it 'Is process the attributes before save' do
      expect(list_feed.save!).to be true
      expect(list_feed.instance_type).to eq 'TaskDone'
      expect(list_feed.instance_data).to include(task_id: 12)
    end

    it 'Instanceate the builder using the database information' do
      list_feed.save!

      other_feed = described_class.find(list_feed.id)

      expect(other_feed.builder).to be_instance_of FeedBuilders::TaskDone
      expect(other_feed.builder.data).to include(task_id: 12)
    end
  end
end
