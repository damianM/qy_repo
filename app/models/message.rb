class Message < ActiveRecord::Base
  belongs_to :sender, :class_name => "User"
  belongs_to :receiver, :class_name => "User"
  has_one :details, :class_name => "MessageDetails"
  validates_presence_of :title;


  def self.send_invitation(user, receiver)
      @message = Message.new
      @message.sender = user
      @message.receiver = receiver
      @message.read = 0
      (@message.details=MessageDetails.new(:details => 0)).save!
      @message.title="Zaproszenie do listy znajomych"
      @message.content = "Użytkownik <a href=\"/user/show/#{user.id}\"> #{user.login}</a> zaprosił
Cię do listy znajomych,<br/><br/><br/><a href=\"/relationship/accept/#{user.id}\" class=\"relationship_accept\">Akceptuję zaproszenie!</a>"
      @message.save
  end

  def trash?
    self.details ? self.details.trash? : false
  end

  def send_trash?
    self.details ? self.details.send_trash? : false
  end
end

