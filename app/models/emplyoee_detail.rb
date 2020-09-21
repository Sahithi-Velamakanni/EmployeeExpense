class EmplyoeeDetail < ApplicationRecord
    has_many :expenses
    validates :name, :department,:status,:email_id, presence: true
    attr_accessor :user_id
    
end
