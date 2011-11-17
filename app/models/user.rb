class User < ActiveRecord::Base    
  mount_uploader :avatar, AvatarUploader
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessor :login
  
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :avatar, :login, :username
  
  # Relations
  has_many :lists, :dependent => :destroy
  
  # Validations.
  validates_presence_of :username
  validates_format_of :username, :with => /^\w{5,25}$/
  validates_uniqueness_of :username
  
  # Scope
   scope :find_by_username, ->(username) { first( conditions: { :username => username } ) }

   protected

   def self.find_for_database_authentication(warden_conditions)
     conditions = warden_conditions.dup
     login = conditions.delete(:login)
     where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
   end
end
