# frozen_string_literal: true

require 'rails_helper'

RSpec.describe List, type: :model do
  subject(:list) { build(:list, name: 'My list', owner: User.new) }

  describe 'validations' do
    it { is_expected.to be_valid }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:owner) }
  end

  it 'Is possible to add tasks' do
    4.times { |i| list.tasks << Task.new(todo: "Todo #{i}") }

    expect(list.tasks.size).to be 4
  end
end
