class NotificationsController < ApplicationController
  def update
    notification = current_user.notifications.find(params[:id])
    # read!はupdate(read: true)と同じ処理をする
    notification.read! if notification.unread?
    # redirect_pathはnotification.rbで定義
    redirect_to notification.redirect_path
  end
end
