require 'spec_helper'

describe User do
  let(:user) { FactoryGirl::create(:user) }

  it 'responds to people' do
    expect(user).to respond_to(:people)
  end
  it 'has associated people' do
    expect(user.people).to eq([])
  end

  it 'builds associated people' do
    person_1 = FactoryGirl::create(:person)
    person_2 = FactoryGirl::create(:person)
    [person_1, person_2].each do |person|
      expect(user.people).not_to include(person)
      user.people << person
      expect(user.people).to include(person)
    end
  end
end
