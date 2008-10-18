class Bibliography < ActiveRecord::Base
  belongs_to :user
  has_one :style
end
