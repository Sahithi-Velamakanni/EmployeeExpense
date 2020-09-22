# Load the Rails application.
require_relative 'application'
# Initialize the Rails application.
Rails.application.initialize!
# ActionMailer::Base.delivery_method = :smtp
# ActionMailer::Base.smtp_settings = {
#     :address        => 'smtp.gmail.com',
#     :domain         => 'mail.google.com',
#     :port           => 587,
#     :user_name      => 'anjanisaisahithi@gmail.com',
#     :password       => 'pavankalyan',
#     :authentication => :plain
# }
# ActionMailer::Base.raise_delivery_errors = true