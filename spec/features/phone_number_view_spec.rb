require 'spec_helper'
require 'capybara/rails'
require 'capybara/rspec'

feature "the phone number view" do
  let(:person) { Person.create(first_name: "John", last_name:'Doe')}
  
  context "when looking at the new phone number form" do

    before(:each) do
      visit new_phone_number_path(contact_id: person.id, contact_type: 'Person')
    end

    it "shows the contact's name in the title" do
      expect(page).to have_selector("h1", text: "New Phone Number for #{person.last_name}, #{person.first_name}")
    end
  end

  context "when looking at the edit phone number form" do

    before(:each) do
      person.phone_numbers.create(number: "303-555-1212")
      visit edit_phone_number_path(person.phone_numbers.first)
    end

    it "shows the contact's name in the title" do
      expect(page).to have_selector("h1", text: "Editing Phone Number for #{person.last_name}, #{person.first_name}")
    end
  end
end

