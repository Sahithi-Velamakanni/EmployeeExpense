class BillDetailSerializer < ActiveModel::Serializer
  attributes :id,:emplyoee_detail_id,:invoice_no,:date_of_expense,:description,:amount
end
