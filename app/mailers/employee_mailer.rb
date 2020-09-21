class EmployeeMailer < ApplicationMailer
    default from: 'sahithi.v@vivriticapital.com'
 
  def expense_mail(receipient) 
    mail(to: receipient, subject: 'The status of your expense has been changed')
  end
end
