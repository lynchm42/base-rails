# == Schema Information
#
# Table name: criteria
#
#  id          :integer          not null, primary key
#  name        :string
#  weight      :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  decision_id :integer
#
class Criterium < ApplicationRecord

  has_many(:scores, { :class_name => "Score", :foreign_key => "criteria_id", :dependent => :destroy })
  
  belongs_to(:decision, { :required => true, :class_name => "Decision", :foreign_key => "decision_id" })

end
