# frozen_string_literal: true

ActiveAdmin.register Comment, as: 'Comments' do
  permit_params :body, :image_id, :user_id
  config.per_page = 25

  index do
    selectable_column
    id_column
    column(:image) { |comment| image_tag(comment.image.picture_url, size: '150x100') }
    column(:body) { |comment| link_to(comment.body, admin_comment_path(comment)) }
    column(:category) { |comment| link_to(comment.image.category.title, admin_all_category_path(comment.image.category)) }
    column(:user) { |comment| link_to(comment.user.email, admin_user_path(comment.user)) }
    column :created_at
    column :updated_at
    actions
  end

  show do
    attributes_table do
      row :id
      row :body
      row :image do |comment|
        image_tag(comment.image.picture_url, size: '150x100')
      end
      row(:category) { |comment| link_to(comment.image.category.title, admin_all_category_path(comment.image.category)) }
      row(:user) { |category| link_to(category.user.email, admin_user_path(category.user)) }
      row :created_at
      row :update_at
    end
  end

  form do |f|
    f.inputs 'Comment details' do
      f.input :body
      f.input :user, as: :select, collection: Hash[User.all.map { |b| [b.email, b.id] }], include_blank: true
      f.input :image_id, as: :select, collection: Image.all, include_blank: false
    end
    f.actions
  end
end
