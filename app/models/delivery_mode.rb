class DeliveryMode < ActiveRecord::Base
  has_many :providers
end