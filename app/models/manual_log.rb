class ManualLog < ActiveRecord::Base
  validates :request, presence: true
end
