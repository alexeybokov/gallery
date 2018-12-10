# frozen_string_literal: true

ActiveAdmin.register Image, as: 'Images' do
  permit_params :name, :picture, :category_id, :user_id
  config.per_page = 25

  controller do
    def find_resource
      @image = Image.friendly.find(params[:id])
    end
  end

  form do |f|
    f.inputs 'Image details' do
      f.input :name
      f.input :picture
      f.input :user_id, as: :select, collection: User.all, include_blank: false
      f.input :category_id, as: :select, collection: Category.all, include_blank: false
    end
    f.actions
  end
end
