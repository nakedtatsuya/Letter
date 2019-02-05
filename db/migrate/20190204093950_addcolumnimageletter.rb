class Addcolumnimageletter < ActiveRecord::Migration[5.1]
  def change
    add_column :letters, :image, :string
  end
end
