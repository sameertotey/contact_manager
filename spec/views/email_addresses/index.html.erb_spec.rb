require 'spec_helper'

describe "email_addresses/index" do
  before(:each) do
    assign(:email_addresses, [
      stub_model(EmailAddress,
        :address => "Address",
        :person => nil
      ),
      stub_model(EmailAddress,
        :address => "Address",
        :person => nil
      )
    ])
  end

  it "renders a list of email_addresses" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
