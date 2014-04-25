class SubscritionType < ActiveRecord::Base
  has_many :subscribed_tos
  belongs_to :providers
end