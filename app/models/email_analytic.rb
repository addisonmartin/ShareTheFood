# == Schema Information
#
# Table name: email_analytics
#
#  id         :bigint           not null, primary key
#  clicked_at :datetime
#  mailer     :string
#  opened_at  :datetime
#  sent_at    :datetime
#  subject    :text
#  to         :text
#  token      :string
#  user_type  :string
#  user_id    :bigint
#
# Indexes
#
#  index_email_analytics_on_token                  (token)
#  index_email_analytics_on_user_type_and_user_id  (user_type,user_id)
#
class EmailAnalytic < ApplicationRecord
  belongs_to :user, polymorphic: true, optional: true
end
