class CreateEmailAddresses < ActiveRecord::Migration
  def change
    create_table :email_addresses do |t|
      t.string :address
      t.references :person, index: true

      t.timestamps
    end
  end
end
