require './lib/item'
require './lib/vendor'

class Market 
  attr_reader :name, :vendors

  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    names = @vendors.map do |vendor|
      vendor.name
    end
    names
  end

  def vendors_that_sell(item)
    vendors_selling = vendors.map do |vendor|
      vendor if vendor.inventory.include?(item)
    end
    vendors_selling.compact
  end

end