# frozen_string_literal: true

class List < ApplicationRecord
  # relations
  has_and_belongs_to_many :users, uniq: true
  has_many :tasks, dependent: :destroy
  has_many :list_feeds, dependent: :destroy
  belongs_to :owner, class_name: 'User'

  # nesteds.
  accepts_nested_attributes_for :tasks, reject_if: ->(a) { a[:todo].blank? }, allow_destroy: true

  # validations.
  validates :name, presence: true
  validates :owner, presence: true

  # scopes
  scope :all_public, -> { where(private: false) }

  def favorite?(user)
    users.include?(user)
  end
end
