class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.string :name, null: false
      t.string :cpi, null: false
      t.integer :length_of_interview, null: false
      t.timestamps null: false
    end
    add_index :campaigns, :name, :unique => true
  end
end
