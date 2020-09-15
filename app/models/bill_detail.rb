class BillDetail < ApplicationRecord
    belongs_to :emplyoee_detail
    validates :invoice_no, uniqueness: true
    # has_attached_file :related_pdfs
    # validates_attachment :related_pdfs, content_type: { content_type: "application/pdf" }

end
