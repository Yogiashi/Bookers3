class NotificationsController < ApplicationController

  def index
    @notifications = current_user.notifications.order(created_at: :desc)
    @notifications.where(checked: false).each do |notification|
      notification.update(checked: true)
    end
  end

  def destroy
    @notifications = current_user.notifications.find(params[:id]).destroy
    redirect_to notifications_path
  end
end
