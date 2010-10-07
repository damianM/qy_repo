# -*- coding: utf-8 -*-
class User < ActiveRecord::Base

  acts_as_authentic

  has_many :relationships
  has_many :friends, :through => :relationships, :conditions => "status = 'accepted'"
  has_many :pending_friends, :through => :relationships, :source => "friend", :conditions => "status = 'pending'"
  has_many :requested_friends, :through => :relationships, :source => "friend", :conditions => "status = 'requested'"

  has_many :galleries

  has_many :sent, :class_name => "Message", :foreign_key => "sender_id"
  has_many :received, :class_name => "Message", :foreign_key => "receiver_id"

  has_many :comments, :as => :commentable, :dependent => :destroy
  has_many :post_comments, :class_name => "Comment", :foreign_key => "user_id"

  has_many :teamusers
  has_many :teams, :through => :teamusers, :foreign_key => "user_id"
  has_many :userqueries
  has_many :cqueries, :through => :userqueries, :source => :query
  has_many :queries
  has_many :events

  has_many :rates

  has_one :quad, :dependent => :destroy

  belongs_to :photo
  belongs_to :state

  accepts_nested_attributes_for :quad, :reject_if => proc { |attributes| attributes['company_id'].blank? }

  validates_uniqueness_of :login, :email
  validates_format_of :login, :with => /^[A-Za-z0-9_]+$/, :message => "W nazwie użytkownika dozwolone są wyłącznie duże i małe litery, cyfry oraz podkreślniki"
  validates_format_of :email, :with => /^[A-Z0-9._%-]+@[A-Z0-9._%-]+$/i, :message => "Podany adres nie jest poprawnym adresem email"
  validates_confirmation_of :password    
  validates_uniqueness_of :skype, :allow_nil => true, :allow_blank => true
  validates_uniqueness_of :gg, :allow_nil => true, :allow_blank => true
  
  named_scope :active, :conditions => [ "users.active = ?", true]

  def self.find_all_by_company_id company_id
    User.find(:all, :joins => :quad, :conditions => [ "users.active = ? AND quads.company_id = ?", true, company_id])
  end

  def friend?(user)
    self.friends.include?(user)
  end

  def initiator
    r=Relationship.find_all_by_initiator_id(self.id)
    r.collect!{|x| x.friend}
    r-[self]
  end

  def ninitiator
    self.friends-self.initiator
  end

  def pending?(user)
    self.pending_friends.include?(user)
  end

  def requested?(user)
    self.requested_friends.include?(user)
  end

  def unread
    i=0
    self.received.each{|x| i+=1 unless (x.read and x.read==1)}
    i
  end

  def delete
    transaction do
      if user.quad
        quad.destroy
      end

      rel = Relationship.find_by_user_id(user,friend)
      rel.destroy
      rel = self.find_by_user_id_and_friend_id(friend,user)
      rel.destroy

    end
  end

  def deliver_password_reset_instructions!
    reset_perishable_token!
    UserMailer.deliver_password_reset_instructions(self)
  end

  def active?
    active
  end

  def activate!
    self.active = true
    save
  end

  def role_symbols
    self ? [self.class.to_s.underscore.to_sym] : [:guest]
  end
   
  def deliver_activation_instructions!
    reset_perishable_token!
    UserMailer.deliver_activation_instructions(self)
  end

  def deliver_activation_confirmation!
    reset_perishable_token!
    UserMailer.deliver_activation_confirmation(self)
  end

  def deliver_greeting!
    UserMailer.deliver_greeting(self)
  end

  def is_admin?
    instance_of?(Admin)
  end

end
