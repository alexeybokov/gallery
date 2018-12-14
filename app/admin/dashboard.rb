ActiveAdmin.register_page 'Dashboard' do

  menu priority: 1, label: proc { I18n.t('active_admin.dashboard') }

  content title: proc { I18n.t('active_admin.dashboard') } do

    h5 section 'Recently 5 Categories' do
      table_for Category.last(5) do |category|
        category.column(:id)
        category.column(:title) { |el| link_to(el.title, admin_all_category_path(el)) }
        category.column(:user_id) { |elem| link_to(elem.user&.email, admin_user_path(elem.user)) }
      end
    end

    h5 section 'Recently 5 Comments' do
      table_for(Comment.last(5).map) do |comment|
        comment.column(:id)
        comment.column(:image) { |comment| image_tag(comment.image.picture_url, size: '150x100') }
        comment.column(:category) { |comment| link_to(comment.image.category.title, admin_all_category_path(comment.image.category)) }
        comment.column(:body) { |item| link_to(item.body, admin_comment_path(item)) }
        comment.column(:user) { |elem| link_to(elem.user&.email, admin_user_path(elem.user)) }
      end
    end

    h5 section 'Recently 10 Images' do
      table_for(Image.last(10)) do |image|
        image.column(:id)
        image.column(:picture) { |img| image_tag(img.picture.url, size: '150x100') }
        image.column(:name) { |item| link_to(item.name, admin_image_path(item)) }
        image.column(:category)
        image.column(:user) { |category| link_to(category.user.email, admin_image_path(category.user)) }
      end
    end
  end
end
