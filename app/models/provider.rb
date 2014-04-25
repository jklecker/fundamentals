class Provider < ActiveRecord::Base
  has_many :subscribed_tos 
  belongs_to :delivery_mode
  belongs_to :content_area
  has_many :subscription_types
  has_many :content_elements
end
