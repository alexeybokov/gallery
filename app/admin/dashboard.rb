ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span I18n.t("active_admin.dashboard_welcome.welcome")
        small I18n.t("active_admin.dashboard_welcome.call_to_action")
      end
    end

    # Here is an example of a simple dashboard with columns and panels.
    #
    columns do
      column do
        panel "Recent 5 Category" do
          ul do
            Category.last(5).map do |category|
              li link_to(category.title, categories_path(category))
            end
          end
        end

        panel "Recently 5 Comment" do
          ul do
            Comment.last(5).map do |comment|
              li link_to(comment.body, image_comments_path(comment))
            end
          end
        end

        panel "Recently 10 Images" do
          ul do
            Image.last(5).map do |image|
              li link_to(image.name, images_path(image))
            end
          end
        end
      end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    end
  end # content
end
