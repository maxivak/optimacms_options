module OptionConcern
  extend ActiveSupport::Concern

  included do

    def myset
      return '111'
    end

  end
end
