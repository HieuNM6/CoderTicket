class ChangeFormatInTicket < ActiveRecord::Migration
  def change
    change_column :tickets, :phone, :string
  end
end
