class Query < ActiveRecord::Base
  validates :input, presence: true, uniqueness: true
end
