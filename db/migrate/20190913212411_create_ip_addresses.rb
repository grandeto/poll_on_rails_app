class CreateIpAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :ip_addresses do |t|
      t.references :poll, null: false, foreign_key: true
      t.string :ip_address, null: false

      t.timestamps
    end
  end
end
