# == Schema Information
#
# Table name: things
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Thing < ApplicationRecord
  has_many :taggings
  has_many :tags, :through => :taggings
end
