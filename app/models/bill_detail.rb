class BillDetail < ApplicationRecord
    belongs_to :expense
    has_many :comments, as: :commentable
    validates :invoice_no, uniqueness: true
    # has_attached_file :related_pdfs
    # validates_attachment :related_pdfs, content_type: { content_type: "application/pdf" }

end
