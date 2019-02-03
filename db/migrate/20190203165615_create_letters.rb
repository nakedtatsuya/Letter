class CreateLetters < ActiveRecord::Migration[5.1]
  def change
    create_table :letters do |t|
      t.string :from_name
      t.string :message
      t.string :to_name

      t.timestamps
    end
  end
end
