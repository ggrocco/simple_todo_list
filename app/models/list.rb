class List < ActiveRecord::Base

  # relations
  has_many :tasks, :dependent => :destroy
  accepts_nested_attributes_for :tasks, :reject_if => lambda { |a| a[:todo].blank? }, :allow_destroy => true
  
  # validations.
  validates_presence_of :name
  
  # scopes
end
