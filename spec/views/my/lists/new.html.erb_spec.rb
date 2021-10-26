# frozen_string_literal: true

require 'rails_helper'

describe 'my/lists/new.html.erb' do
  before do
    assign(:list, build(:list, name: 'Name', id: 1, private: false))
  end

  it 'renders new list form' do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select 'form', action: my_lists_path, method: 'post' do
      assert_select 'input#list_name', name: 'list[name]'
      assert_select 'input#list_private', name: 'list[private]'
    end
  end
end
