class AddDefaultValueForPusblish < ActiveRecord::Migration
  def change
    change_column :events, :publish, :bool, default: false
  end
end
