# frozen_string_literal: true

ActiveAdmin.register Activity do
  permit_params :user_id, :action, :url

  index do
    selectable_column
    id_column
    column(:user) { |activity| link_to(activity.user.email, admin_user_path(activity.user)) }
    column :action
    column :url
    column :created_at
    column :updated_at
    actions
  end

  show do
    attributes_table do
      row :id
      row(:user) { |activity| link_to(activity.user.email, admin_user_path(activity.user)) }
      row :url
      row :created_at
      row :updated_at
    end
  end
end
