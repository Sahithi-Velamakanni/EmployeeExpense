class Expense < ApplicationRecord
    belongs_to :emplyoee_detail
    has_many :bill_details
    has_many :comments, as: :commentable

end
