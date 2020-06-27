class NotificationsController < ApplicationController
  def index
    @notificatons = current_user.notifications.order(created_at: :desc)
  end

  def update
    notification = current_user.notifications.find(params[:id])
    # read!はupdate(read: true)と同じ処理をする
    notification.read! if notification.unread?
    # redirect_pathはnotification.rbで定義
    redirect_to notification.redirect_path
  end

  def all_read
    notifications = current_user.notifications.where(read: "unread")
    notifications.update(read: "read")
    redirect_to notifications_path
  end
end
