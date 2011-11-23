class List < ActiveRecord::Base

  # relations
  has_and_belongs_to_many :users, :uniq => true
  has_many :tasks, :dependent => :destroy
  belongs_to :owner, :class_name => "User", :foreign_key => "owner_id"
  
  # nesteds.
  accepts_nested_attributes_for :tasks, :reject_if => lambda { |a| a[:todo].blank? }, :allow_destroy => true
  
  # validations.
  validates_presence_of :name
  validates_presence_of :owner
  
  # scopes
  scope :all_public, where( :private => false )
  
  def has_favorite?(user)
    users.include?(user)
  end
end
