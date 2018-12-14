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

  index do
    selectable_column
    id_column
    column(:title) { |category| link_to(category.title, admin_all_category_path(category)) }
    column(:user) { |category| link_to(category.user.email, admin_user_path(category.user)) }
    column :created_at
    column :updated_at
    actions
  end

  show do
    attributes_table do
      row :id
      row :range_counter
      row :title
      row(:user) { |category| link_to(category.user.email, admin_user_path(category.user)) }
      row :created_at
      row :updated_at
    end
  end

  form do |f|
    f.inputs 'Category details' do
      f.input :title
      f.input :user_id, as: :select, collection: Hash[User.all.map { |b| [b.email, b.id] }], include_blank: true
    end
    f.actions
  end
end
