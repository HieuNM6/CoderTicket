class AddInfoToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :name, :string
    add_column :tickets, :address, :string
    add_column :tickets, :phone, :integer
  end
end
