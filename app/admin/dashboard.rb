ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do
    div :class => "blank_slate_container", :id => "dashboard_default_message" do
      span :class => "blank_slate" do
        span "Welocme to Tennis Widow League super admin panel"
        small "Go to 'Users' tab to create user accounts for players and division managers. Please note that this super admin panel is intented to be used only by super admin. For noraml administartive tasks, plaese create an admin user"
        small "Options under 'Advanced' tab are meant for recovery tasks like deleting a wrong entry if it cause main interface to fail. Stay away from it unless you know what you are doing"
      end
    end

    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  end # content
end
