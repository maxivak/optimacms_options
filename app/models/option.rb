class Option < ActiveRecord::Base

  ### search
  paginates_per 10

  ### search
  searchable_by_simple_filter

  #
  include OptionConcern

  #
  def self.get(name, v_def=nil)
    row = where("name = ?",  name).first
    return v_def if row.nil?

    row.value
  end

  def self.set(name, v)
    n = where("name = ?", name).update_all(:value => v)
  end
end
