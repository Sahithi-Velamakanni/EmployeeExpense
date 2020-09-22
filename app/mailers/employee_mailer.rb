class EmployeeMailer < ApplicationMailer
    default from: 'pandasahithi1234@gmail.com'
 
  def expense_mail(receipient) 
    mail(to: 'sahithi.v@vivriticapital.com', subject: 'The status of your expense has been changed')
  end
end
