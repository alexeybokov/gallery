class UserMailer < ApplicationMailer
  # include Resque::Mailer

  before_action :user_params
  before_action :category_url, only: %i[follow_email new_image_email]

  def welcome_email
    @url = 'http://localhost:3000/users/sign_in'
    mail(to: @user.email, subject: 'Welcome Gallery') if @user.email.present?
  end

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
