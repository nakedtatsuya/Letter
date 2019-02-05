class AddColumnuuid < ActiveRecord::Migration[5.1]
  def change
    add_column :letters, :uuid, :string
  end
end
