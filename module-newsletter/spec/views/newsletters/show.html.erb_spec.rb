require 'rails_helper'

RSpec.describe "newsletters/show", type: :view do
  before(:each) do
    @newsletter = assign(:newsletter, Newsletter.create!(
      :name => "Name",
      :email => "Email",
      :accepted => false,
      :inactive => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
  end
end
