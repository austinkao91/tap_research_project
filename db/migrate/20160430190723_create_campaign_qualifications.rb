class CreateCampaignQualifications < ActiveRecord::Migration
  def change
    create_table :campaign_qualifications do |t|
      t.integer :campaign_quota_id, null: false
      t.integer :question_id, null: false
      t.text :pre_codes, null: false
      t.timestamps null: false
    end
    add_index :campaign_qualifications, :campaign_quota_id
    add_index :campaign_qualifications, :question_id
  end
end
