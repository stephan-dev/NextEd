# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "students/index", type: :view do
  before do
    assign(:students, Kaminari.paginate_array(create_list(:student, 2, :sections)).page(1))
  end

  it "renders a list of students" do
    render
    assert_select "tr>td", text: "First Name".to_s, count: 2
    assert_select "tr>td", text: "Last Name".to_s, count: 2
  end
end
