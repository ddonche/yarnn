class Notification < ApplicationRecord
  enum notification_type: { comment: 0, notation: 1, message: 2, follow: 3, unfollow: 4, dispute: 5 }
  enum read: { read: true, unread: false }
  belongs_to :notified_by, class_name: 'User'
end