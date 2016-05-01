# == Schema Information
#
# Table name: campaigns
#
#  id                  :integer          not null, primary key
#  name                :string           not null
#  cpi                 :string           not null
#  length_of_interview :integer          not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class Campaign < ActiveRecord::Base
  validates :name, :cpi, :length_of_interview, :presence => true
  validates :name, :uniqueness => true
  has_many :campaign_quotas

end
