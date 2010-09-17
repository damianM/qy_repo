class Relationship < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, :class_name => "User", :foreign_key => "friend_id"
  belongs_to :initiator, :class_name => "User", :foreign_key => "initiator_id"

  def accepted?
    self.status=="accepted"
  end

  def self.req(user, friend)
    unless user == friend or user.friend?(friend)
      transaction do
        create(:user => user, :initiator => user, :friend => friend, :status => "pending")
        create(:user => friend, :initiator => user,  :friend => user, :status => "requested")
      end
    end
  end

  def self.accept(user, friend)
    
    if user != friend and !user.friend?(friend) and user.requested?(friend)
      
      transaction do
        rel = self.find_by_user_id_and_friend_id(user,friend)
        rel.status="accepted"
        rel.save!
        rel = self.find_by_user_id_and_friend_id(friend,user)
        rel.status="accepted"
        rel.save!
      end
    end
  end

  def self.delete(user, friend)
    if user.friend?(friend) or user.pending?(friend) or user.requested?(friend)
      transaction do
        rel = self.find_by_user_id_and_friend_id(user,friend)
        rel.destroy
        rel = self.find_by_user_id_and_friend_id(friend,user)
        rel.destroy
      end
    end
  end
end
