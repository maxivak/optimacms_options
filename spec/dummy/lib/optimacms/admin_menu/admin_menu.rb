module Optimacms
  module AdminMenu
    class AdminMenu
      include Optimacms::Concerns::AdminMenu::AdminMenu

      def self.get_menu_custom
        [
            {
                title: 'Settings', route: nil,
                submenu: [
                    {title: 'Settings', url: '/'+Optimacms.admin_namespace+'/options' },
                ]
            }



        ]
      end

    end
  end
end
