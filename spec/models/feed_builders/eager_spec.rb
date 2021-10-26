# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FeedBuilders::Eager, type: :model do
  let(:eager) { described_class.new }
  let(:user) { create(:user, :with_list) }
  let(:list) { user.lists.first }
  let(:task) { list.tasks.first }

  let(:proxy) { eager.proxy }

  before do
    proxy.load(:task, list.id)
  end

  it 'the proxy can get a item from db' do
    expect(proxy.get(:task)).to be(task)
  end
end
