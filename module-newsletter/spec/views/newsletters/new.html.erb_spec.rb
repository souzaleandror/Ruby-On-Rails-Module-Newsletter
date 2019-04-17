require 'rails_helper'

RSpec.describe "newsletters/new", type: :view do
  before(:each) do
    assign(:newsletter, Newsletter.new(
      :name => "MyString",
      :email => "MyString",
      :inactive => false
    ))
  end

  it "renders new newsletter form" do
    render

    assert_select "form[action=?][method=?]", newsletters_path, "post" do

      assert_select "input[name=?]", "newsletter[name]"

      assert_select "input[name=?]", "newsletter[email]"

      assert_select "input[name=?]", "newsletter[inactive]"
    end
  end
end
