module Optimacms
  module AdminMenu
    class AdminMenu
      include Optimacms::Concerns::AdminMenu::AdminMenu

      def self.get_menu_custom
        [
            {
                title: 'Settings', route: nil,
                submenu: [
                    {title: 'Settings', url: '/cmsadmin/options' },
                ]
            }



        ]
      end

    end
  end
end
