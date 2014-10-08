email_settings = YAML::load(ERB.new(File.read("#{Rails.root.to_s}/config/email.yml")).result)[Rails.env]

if email_settings.present?
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings = email_settings["smtp_settings"].symbolize_keys
end

