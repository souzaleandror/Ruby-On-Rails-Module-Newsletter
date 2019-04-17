require 'rails_helper'

RSpec.describe "newsletters/edit", type: :view do
  before(:each) do
    @newsletter = assign(:newsletter, Newsletter.create!(
      :name => "MyString",
      :email => "MyString",
      :inactive => false
    ))
  end

  it "renders the edit newsletter form" do
    render

    assert_select "form[action=?][method=?]", newsletter_path(@newsletter), "post" do

      assert_select "input[name=?]", "newsletter[name]"

      assert_select "input[name=?]", "newsletter[email]"

      assert_select "input[name=?]", "newsletter[inactive]"
    end
  end
end
