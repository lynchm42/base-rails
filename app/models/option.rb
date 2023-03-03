# == Schema Information
#
# Table name: options
#
#  id          :integer          not null, primary key
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  decision_id :integer
#
class Option < ApplicationRecord

  belongs_to(:decision, { :required => true, :class_name => "Decision", :foreign_key => "decision_id" })

  has_many(:scores, { :class_name => "Score", :foreign_key => "option_id", :dependent => :destroy })
  
end
