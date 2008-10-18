class Citation < ActiveRecord::Base
  belongs_to :bibliography
  has_and_belongs_to_many :authors
end
