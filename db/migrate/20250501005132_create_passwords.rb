class CreatePasswords < ActiveRecord::Migration[8.0]
  def change
    create_table :passwords do |t|
      t.string :password
      t.string :strength

      t.timestamps
    end
  end
end
