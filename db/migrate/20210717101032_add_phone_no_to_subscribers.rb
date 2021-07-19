class AddPhoneNoToSubscribers < ActiveRecord::Migration[6.1]
  def change
    add_column :subscribers, :phone_no, :string
  end
end
