class Fpost < ActiveRecord::Base
  belongs_to :user
  belongs_to :topic

  def rights?(u)
    puts "tutaj!"
    (user==u or topic.forum.team.owner == u) and self!=topic.posts[0]
  end
end
