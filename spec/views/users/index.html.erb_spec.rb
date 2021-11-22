require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        email: "Email@1234.com",
        password: "1234^Go"
      ),
      User.create!(
        email: "Email@asdf.com",
        password: "12345"
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", text: "Email".to_s, count: 2
    assert_select "tr>td", text: "".to_s, count: 2
  end
end
