# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar do |attachable|
    attachable.variant :thumb, resize: '40x40'
  end

  # Setup accessible (or protected) attributes for your model
  attr_accessor :email, :password, :password_confirmation, :remember_me, :avatar, :login, :username

  # relations
  has_and_belongs_to_many :favorites, class_name: 'List', uniq: true
  has_many :lists, dependent: :destroy, foreign_key: 'owner_id', inverse_of: :users
  has_many :list_feeds, through: :favorites

  # validations
  validates :username, presence: true, format: { with: /\A\w{5,25}\z/ }, uniqueness: true

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    login = conditions.delete(:login)
    where(conditions).where(['lower(username) = :value OR lower(email) = :value', { value: login.downcase }]).first
  end
end
