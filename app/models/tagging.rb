# == Schema Information
#
# Table name: taggings
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  tag_id     :integer
#  thing_id   :integer
#
class Tagging < ApplicationRecord
  belongs_to :thing
  belongs_to :tag
end
