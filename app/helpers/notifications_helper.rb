module NotificationsHelper
  
  def unchecked_notifications
    @notifications = current_user.notifications.where(read: "unread")
  end

end
