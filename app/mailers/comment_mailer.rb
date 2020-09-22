class CommentMailer < ApplicationMailer
    default from: 'pandasahithi1234@gmail.com'
 
    def comment_mail(receipient) 
      mail(to: 'sahithi.v@vivriticapital.com', subject: 'A comment has been added on ur bill/expense')
    end
end
