class EmplyoeeDetail < ApplicationRecord
    #has_many :bill_details, as :bill_detailable, polymorphic = true
    has_many :bill_details
    validates :name, :department,:status,:email_id, presence: true
    validate :user_authentication

    attr_accessor :user_id

    def user_authentication
        binding.pry
        user=EmplyoeeDetail.find(user_id.to_i)
        if user.department != 'admin'
            error[:user] << "autentication failed" 
        end
        
    end
    
end
