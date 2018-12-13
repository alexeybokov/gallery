ActiveAdmin.register_page 'Dashboard' do

  menu priority: 1, label: proc{ I18n.t('active_admin.dashboard') }

  content title: proc { I18n.t('active_admin.dashboard') } do

    section 'Recently 5 Categories' do
      table_for Category.last(5) do |category|
        category.column(:id)
        category.column(:title) do |el|
          link_to(el.title, admin_all_category_path(el))
        end
        category.column(:user_id) do |elem|
          link_to(elem.user&.email, admin_user_path(elem.user))
        end
      end
    end

    section 'Recently 5 Comments' do
      table_for Comment.last(5).map do |comment|
        comment.column(:id)
        comment.column(:body) do |item|
          link_to(item.body, admin_comment_path(item))
        end
        comment.column(:image_id) do |elem|
          link_to(elem.image&.name, admin_image_path(elem.image))
        end
        comment.column(:user_id) do |elem|
          link_to(elem.user&.email, admin_user_path(elem.user))
        end
      end
    end

    section 'Recently 10 Images' do
      table_for Image.last(10) do |image|
        image.column(:id)
        image.column 'Image' do |img|
          image_tag(img.picture.url, size: '60x40')
        end
        image.column(:name) do |item|
          link_to(item.name, admin_image_path(item))
        end
        image.column(:category_id) do |elem|
          link_to(elem.category&.title, admin_all_category_path(elem.category))
        end
      end
    end
  end
end
