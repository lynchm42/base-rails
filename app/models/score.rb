# == Schema Information
#
# Table name: scores
#
#  id          :integer          not null, primary key
#  score       :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  criteria_id :integer
#  option_id   :integer
#
class Score < ApplicationRecord

  belongs_to(:criteria, { :required => true, :class_name => "Criterium", :foreign_key => "criteria_id" })

  belongs_to(:option, { :required => true, :class_name => "Option", :foreign_key => "option_id" })
  
end
