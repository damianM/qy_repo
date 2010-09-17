class UserMailer < ActionMailer::Base
  
def greeting(user)
  @subject = "Witamy wśród quadomaniaków!"
  @body={}
  @body['user']=user
  @recipients = user.email
  @sent_on=Time.now
  @from = 'quadomaniacy.pl <noreply@quadomaniacy.pl>'
  @content_type = "text/html"

end

def new_message(user,sender)
  @subject = "Masz nową wiadomośc na quadomaniacy.pl!"
  @body={}
  @body['user']=user
  @body['sender']=sender
  @recipients = user.email
  @sent_on=Time.now
  @from = 'quadomaniacy.pl <noreply@quadomaniacy.pl>'
  @content_type = "text/html"
end

def password_reset_instructions(user)
  @subject="Instrukcja odzyskiwania hasła - quadomaniacy.pl"
  @from="quadomaniacy.pl <noreply@quadomaniacy.pl>"
  @recipients=user.email
  @sent_on=Time.now
  @body['edit_password_reset_url'] = user.perishable_token
  @body['user']=user
  @content_type = "text/html"
end

def activation_instructions(user)
    subject       "Instrukcja aktywacji konta"
    from          "quadomaniacy.pl <noreply@quadomaniacy.pl>"
    recipients    user.email
    sent_on       Time.now
    body          :account_activation_url => "http://quadomaniacy.pl/register/#{user.perishable_token}"
    content_type  "text/html"
  end

  
end
