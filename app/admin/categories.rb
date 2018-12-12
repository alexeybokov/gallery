# frozen_string_literal: true

ActiveAdmin.register Category, as: 'All Category' do
  # scope :all, default: true
  permit_params :title, :user_id
  config.per_page = 15

  controller do
    def find_resource
      @category = Category.friendly.find(params[:id])
    end
  end

  scope :all, default: true

  index do
    selectable_column
    id_column
    column :title
    column :user_id
    column :created_at
    actions
  end

  form do |f|
    f.inputs 'Category details' do
      f.input :title
      f.input :user_id
    end
    f.actions
  end
end
