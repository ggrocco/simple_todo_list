# frozen_string_literal: true

require 'rails_helper'

describe 'lists/index.html.erb' do
  before do
    assign(:lists, [
             build(:list, name: 'Name', id: 1, private: false),
             build(:list, name: 'Name', id: 1, private: false)
           ])
  end

  it 'renders a list of lists' do
    allow(view).to receive(:user_signed_in?).and_return(false)

    render

    assert_select 'div.list_name', text: 'Name'.to_s, count: 2
  end
end
