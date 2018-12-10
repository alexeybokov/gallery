# frozen_string_literal: true

ActiveAdmin.register Comment, as: 'Comments' do
  permit_params :body, :image_id, :user_id
  config.per_page = 25

  form do |f|
    f.inputs 'Comment details' do
      f.input :body
      f.input :user_id, as: :select, collection: User.all, include_blank: false
      f.input :image_id, as: :select, collection: Image.all, include_blank: false
    end
    f.actions
  end
end
