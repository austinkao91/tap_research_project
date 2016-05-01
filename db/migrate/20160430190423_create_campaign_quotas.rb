class CreateCampaignQuotas < ActiveRecord::Migration
  def change
    create_table :campaign_quotas do |t|
      t.integer :campaign_id, null: false
      t.timestamps null: false
    end
    add_index :campaign_quotas, :campaign_id
  end
end
