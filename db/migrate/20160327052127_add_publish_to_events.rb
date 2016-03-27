class AddPublishToEvents < ActiveRecord::Migration
  def change
    add_column :events, :publish, :bool
  end
end
