class AddUserIdToPeople < ActiveRecord::Migration
  def change
    add_reference :people, :user
  end
end
