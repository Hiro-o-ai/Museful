module NotificationsHelper
  # 未読を調べるために使用
  def unchecked_notifications
    current_user.notifications.where(read: "unread")
  end
end
