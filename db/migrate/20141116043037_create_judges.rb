class CreateJudges < ActiveRecord::Migration
  def change
    create_table :judges do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.boolean :tamu
      t.string :preference

      t.timestamps
    end
    add_index :judges, :email, unique: true
  end
end
