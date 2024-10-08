class CreateRequestLoggers < ActiveRecord::Migration[7.1]
  def change
    create_table :request_loggers do |t|
      t.string :ip_address
      t.integer :request_count
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end

    add_index :request_loggers, :ip_address
  end
end
