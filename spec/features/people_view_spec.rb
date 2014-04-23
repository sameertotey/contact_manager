require 'spec_helper'
require 'capybara/rails'
require 'capybara/rspec'

feature 'the people view' do

  context 'when logged in' do
    let(:user) { FactoryGirl::create(:user) }
    before(:each) do
      login_as(user)
    end

    it 'displays people associated with the user' do
      person_1 = FactoryGirl::create(:person)
      person_1.user = user
      person_1.save
      visit(people_path)
      expect(page).to have_text("#{person_1.first_name} #{person_1.last_name}")
    end

    it "does not display people associated with another user" do
      user_2 = FactoryGirl::create(:user)
      person_2 = FactoryGirl::create(:person)
      person_2.user = user_2
      person_2.save
      visit(people_path)
      expect(page).not_to have_text("#{person_2.first_name} #{person_2.last_name}")
    end

  end

end