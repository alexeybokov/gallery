class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :init_categories
  before_action :set_locale

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  private

  def init_categories
    @categories = Category.order(:title).limit(5)
  end

  def default_url_options
    { locale: I18n.locale }
  end
end
