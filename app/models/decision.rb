# == Schema Information
#
# Table name: decisions
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Decision < ApplicationRecord

  has_many(:criteria, { :class_name => "Criterium", :foreign_key => "decision_id", :dependent => :destroy })

  has_many(:options, { :class_name => "Option", :foreign_key => "decision_id", :dependent => :destroy })
  
end
