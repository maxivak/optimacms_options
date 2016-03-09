# Settings (Options) module for OptimaCMS

Add support to edit options in OptimaCMS admin area. Options are managed by gem [simple_options](https://github.com/maxivak/simple_options).


# Install

## install simple_options

read [simple_options](https://github.com/maxivak/simple_options)


## Install optimacms_options

Gemfile:
```
gem 'simple_options'
gem 'optimacms_options'
```

bundle:
```
bundle install
```


routes:
```
# config/routes.rb

  # optimaCMS modules
  mount Optimacms::Engine => "/", :as => "cms_options"

```

Add links to Admin area menu:
 
```
# lib/optimacms/admin_menu/admin_menu.rb

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
            
```
 


# Overview

Each site may have many options.
Option is identified by name.

Option has fields:
* name - unique name
* value - value stored for the option
* title - human readable name
* description - long description
* option_type - type of the option. = string | int | boolean
* is_changed - whether option can be changed via admin area
* category - name of the category






## Set option value

## Get option value

