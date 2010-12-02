class Team < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :description
  validates_uniqueness_of :name

  has_many :teamusers
  has_many :users, :through => :teamusers, :source => :user, :conditions => "status='member' or status='owner'"
  has_many :pending_users, :through => :teamusers, :source => :user, :conditions => "status='pending'"
  has_one :owner, :through => :teamusers, :source => :user, :conditions => "status='owner'"
  has_one :forum
  has_many :queries, :foreign_key => "user_id"

  def member?(user)
    users.include?(user)
  end
  def pending?(user)
    pending_users.include?(user)
  end
  def owner?(user)
    owner==user
  end

  alias :rights? :owner?
end
