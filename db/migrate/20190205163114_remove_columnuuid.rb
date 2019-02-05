class RemoveColumnuuid < ActiveRecord::Migration[5.1]
  def change
    remove_column :letters, :uuid, :string
  end
end
