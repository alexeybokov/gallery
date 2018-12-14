# frozen_string_literal: true

ActiveAdmin.register Image, as: 'Images' do
  permit_params :name, :picture, :category_id, :user_id
  config.per_page = 25

  controller do
    def find_resource
      @image = Image.friendly.find(params[:id])
    end
  end

  index do
    selectable_column
    id_column
    column(:picture) do |image|
      image_tag(image.picture_url, size: '150x100')
    end
    column(:name) { |image| link_to(image.name, admin_image_path(image)) }
    column(:user) { |category| link_to(category.user.email, admin_image_path(category.user)) }
    column :created_at
    column :updated_at
    actions
  end

  show do
    attributes_table do
      row :id
      row :name
      row :picture do |image|
        image_tag(image.picture_url, size: '150x100')
      end
      row(:category)
      row(:user) { |category| link_to(category.user.email, admin_user_path(category.user)) }
      row :created_at
      row :update_at
    end
  end

  form do |f|
    f.inputs 'Image details' do
      f.input :name
      f.input :picture
      f.input :user, as: :select, collection: Hash[User.all.map { |b| [b.email, b.id] }], include_blank: true
      f.input :category_id, as: :select, collection: Category.order(:title), include_blank: false
    end
    f.actions
  end
end
