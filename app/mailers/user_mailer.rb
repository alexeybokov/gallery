class UserMailer < ApplicationMailer
  # include Resque::Mailer

  before_action :user_params
  before_action :category_url, only: %i[follow_email new_image_email]

  default from: 'from@example.com'


  def follow_email
    mail(to: @user.email, subject: 'Follow') if @user.email.present?
  end

  def new_image_email
    mail(to: @user.email, subject: 'New Image') if @user.email.present?
  end

  private

  def category_url
    @url = "http://localhost:3000/categories/#{params[:category]}"
  end

  def user_params
    @user = params[:user]
  end
end
