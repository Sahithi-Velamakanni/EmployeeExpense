require 'net/http'
module EmployeeHelper
    
    def self.record_scucccessfully_updated  
        m = {}
        m['message'] = 'Status updated successfully'
        m['status'] = 200
        m
    end
    def self.record_could_not_be_saved
        m = {}
        m['message'] = "Record is not created"
        m['status'] = 500
        m
    end
    def self.authorisation_failed
        m = {}
        m['message'] = 'Not Authorised'
        m['status'] = 401
        m
    end
    def self.record_created_successfully
        m = {}
        m['message'] = 'Record Created Successfully'
        m['status'] = 200
        m
    end
    def self.is_authorised_to_action(user_id)
        e=EmplyoeeDetail.find(user_id.to_i)
        return (e.department=='admin')
    end

    def self.create_employee_record(user_id,employee)
        begin
            m = {}
            binding.pry
                #params['user_id'].to_i)
            if self.is_authorised_to_action(user_id)
              @emp = EmplyoeeDetail.create(emp_name: employee['emp_name'],  department: employee['department'], status: employee['status'])
              if @emp.blank?
                m = self.record_could_not_be_saved
              else
                m = self.record_created_successfully
                m['new_employee_id'] = @emp.id
              end 
            else
              m = self.authorisation_failed
            end
            return m
        rescue
            nil 
        end
    end

    def self.update_employee_status(user_id,emp_id,status)
        begin
            m = {}
            binding.pry
            if self.is_authorised_to_action(user_id)
                emp = EmplyoeeDetail.find(emp_id)
                emp.status = status
                emp.save!
                m = self.record_scucccessfully_updated 
            else
              m = self.authorisation_failed
            end
            return m
        rescue
            nil 
        end
    end

    def self.create_bill_detail_records(bill_details,user_id)
        bills=[]
        invoices=[]
        if self.is_authorised_to_action(user_id)
            bill_details.each do |bill|
                bill={}
                b = BillDetail.create(:emp_id => bill['emp_id'] ,:invoice_no =>bill['invoice_no'], 
                    :date_of_expense => bill['data_of_expense'],
                    :description=>bill['description'] , :amount=>bill['amount'])
                bill=self.record_created_successfully
                bill["bill_id"]=b.id 
                bills << bill     
                invoices << {b.id=>bill['invoice_no']}
            end
            response = make_a_external_call_for_invoice_validation(invoices)
            update_bill_status(response)
            return bills.to_json    
        else
            self.authorisation_failed
        end
    end

    def make_a_external_call_for_invoice_validation(invoices)
        begin
            response_status=[]
            invoices.each do |invoice|
                uri = URI.parse('https://my.api.mockaroo.com/invoices.json')
                con=Net::HTTP.new(uri.host, uri.port)
                req= Net::HTTP.Post.new(uri.request_uri,{'API-Key': 'b490bb80'})
                req.body = {"invoice_id" =>invoice[1]}
                response = con.request(req)
                response_status << { invoice[0]=>response.to_json['status']}
            end
            return response_status
        rescue
            nil 
        end
        []
    end
    def update_bill_status(response)
        response.each do |bill|
            b = BillDetail.find(bill[0])
            b.status=(bill[1]=="true") ? "SA":"SR" 
            b.save!
        end
    end
end