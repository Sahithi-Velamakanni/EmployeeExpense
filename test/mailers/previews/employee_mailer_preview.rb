# Preview all emails at http://localhost:3000/rails/mailers/employee_mailer
class EmployeeMailerPreview < ActionMailer::Preview
    def expense_mail
        employee = EmplyoeeDetail.find 3
        @bill_details = employee.expenses[10].bill_details
        EmployeeMailer.with(bill_details: @bill_details, user_name: employee.name).expense_mail(employee.email_id)
    end

end
