require 'spec_helper'

describe Person do

  let(:person) { FactoryGirl::create(:person) }

  it 'is valid' do
    expect(person).to be_valid
  end
  it 'is invalid without a first name' do
    person.first_name = nil
    expect(person).to_not be_valid
  end
  it 'is invalid without a last name' do
    person.last_name = nil
    expect(person).to_not be_valid
  end

  it 'has an array of phone numbers' do
    expect(person.phone_numbers).to eq([])
  end

  it 'has an array of email addresses' do
    expect(person.email_addresses).to eq([])
  end

  it 'responds with its created phone numbers' do
    person.phone_numbers.build(number: '555-8888')
    expect(person.phone_numbers.map(&:number)).to eq(['555-8888'])
  end

  it 'responds with its created email addresses' do
    person.email_addresses.build(address: 'me@example.com')
    expect(person.email_addresses.map(&:address)).to eq(['me@example.com'])
  end

  it "convert to a string with last name, first name" do
    expect(person.to_s).to eq "Smith, Alice"
  end

  it 'is a child of the user' do
    expect(person.user).to be_instance_of(User)
  end
end
