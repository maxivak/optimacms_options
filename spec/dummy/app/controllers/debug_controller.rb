class DebugController < ApplicationController

  def test1
    m = Optimacms::AdminMenu::AdminMenu

    x = m.get_menu

    y=0
  end

  def t2
    u = cms_options.admin_options_url

    y=0
  end

  def t3
    obj = Option.new
    v = obj.myset
    x=0
  end

end
