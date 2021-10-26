# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ListsHelper, type: :helper do
  context 'when link_to_remove_task' do
    it 'add the link_to_remove_task' do
      helper.simple_fields_for :tasks do |t|
        expect(helper.link_to_remove_task('remove', t)).to match(/remove/)
      end
    end

    it "and can't accept empty result" do
      helper.simple_fields_for :tasks do |t|
        expect(helper.link_to_remove_task('remove', t)).not_to be_empty
      end
    end
  end
end
