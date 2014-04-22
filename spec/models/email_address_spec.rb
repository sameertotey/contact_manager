require 'spec_helper'

describe EmailAddress do
  let(:email_address){EmailAddress.new(address: "someone@example.com", contact_id: 1, contact_type: 'Person')}

  it 'is valid' do
    expect(email_address).to be_valid
  end
  it 'is invalid without a address' do
    email_address.address = nil
    expect(email_address).to_not be_valid
  end
   it 'must have a reference to a contact' do
    email_address.contact_id = nil
    expect(email_address).to_not be_valid
  end
  it 'is associated with a contact' do
    expect(email_address).to respond_to(:contact)
  end
end
