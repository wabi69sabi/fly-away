class CreateManualLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :manual_logs do |t|
      t.string :request, null: false, default: ''

      t.timestamps null: false
    end
  end
end
