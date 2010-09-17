class Topic < ActiveRecord::Base
  belongs_to :forum
  has_many :posts, :class_name => "Fpost"

  def self.tr(topic, fpost)
    transaction do
      topic.save
      fpost.save
    end
  end

  def rights?(u)
    forum.team.owner?(u)
  end
end
