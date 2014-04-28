class ProviderSearch < ActiveRecord::Base
  
def self.search(search)
  search_condition = "%" + search + "%"
  find(:all, :providers => ['name LIKE ?', search_condition])
end
  
end