class Service < ApplicationRecord
    belongs_to :admin, class_name: 'Admin', foreign_key: 'admin_id', optional: true
    belongs_to :customer, class_name: 'Customer', foreign_key: 'customer_id', optional: true
    # belongs_to :admin
    enum :status, [  :open,  :closed ]
end
