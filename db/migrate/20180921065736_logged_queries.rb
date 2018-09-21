class LoggedQueries < ActiveRecord::Migration[5.2]
  def change
    create_table :queries do |t|
      t.string :input, null: false, default: ''

      t.timestamps null: false
    end

    add_index :queries, :input, unique: true
  end
end
