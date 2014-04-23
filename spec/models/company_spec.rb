require 'spec_helper'

describe Company do
  let(:company) {FactoryGirl::create(:company)}
  let(:user) { FactoryGirl::create(:user) }


  it 'is valid' do
    expect(company).to be_valid
  end
  it 'is invalid without a name' do
    company.name = nil
    expect(company).to_not be_valid
  end
  it 'has an array of phone numbers' do
    expect(company.phone_numbers).to eq([])
  end
  it "responds with its phone numbers after they're created" do
    phone_number = company.phone_numbers.build(number: "333-4444")
    expect(phone_number.number).to eq('333-4444')
  end

  it 'builds associated companies' do
    company_1 = FactoryGirl::create(:company)
    company_2 = FactoryGirl::create(:company)
    [company_1, company_2].each do |company|
      expect(user.companies).not_to include(company)
      user.companies << company
      expect(user.companies).to include(company)
    end
  end
end
