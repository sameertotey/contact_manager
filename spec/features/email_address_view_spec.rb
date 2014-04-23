require 'spec_helper'
require 'capybara/rails'
require 'capybara/rspec'

feature "the email address view" do
  let(:person) { Person.create(first_name: "John", last_name:'Doe')}
  
  context "when looking at the new email address form" do

    before(:each) do
      visit new_email_address_path(contact_id: person.id, contact_type: 'Person')
    end

    it "shows the contact's name in the title" do
      expect(page).to have_selector("h1", text: "New Email Address for #{person.last_name}, #{person.first_name}")
    end
  end

  context "when looking at the edit email address form" do

    before(:each) do
      person.email_addresses.create(address: "someone1@example.com")
      visit edit_email_address_path(person.email_addresses.first)
    end

    it "shows the contact's name in the title" do
      expect(page).to have_selector("h1", text: "Editing Email for #{person.last_name}, #{person.first_name}")
    end
  end
end

