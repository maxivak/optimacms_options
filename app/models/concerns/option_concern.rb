module OptionConcern
  extend ActiveSupport::Concern

  included do

  end

  module ClassMethods
    # will be overridden in the main app
    #def my_class_method
    #  []
    #end


  end

end
