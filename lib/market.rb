require './lib/item'
require './lib/vendor'

class Market 
  attr_reader :name, :vendors, :total_inventory

  def initialize(name)
    @name = name
    @vendors = []
    @total_inventory = total_inventory
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

  def sorted_item_list
    #for each vendor, for each item in inventory, put the name in array, unique, sorted
    items = @vendors.flat_map do |vendor|
      vendor.inventory.map do |item|
        item.first.name
      end
    end
    items.uniq.sort
  end

  # def total_inventory
  #   #iterate through vendors to pull out items sold from each
  #   #create hash with subhashes of items
  #   items = @vendors.map do |vendor|
  #     vendor.inventory.map do |item|
  #       item
  #     end
  #   end
  #   hash = Hash.new

  #   hash = items.flat_map.uniq do |item|
  #     "quantity" => item.value,
  #     "vendors" => vendors_that_sell(item)
  #   end
  #   @total_inventory = hash
  # end

  # def overstocked_items
  #   overstocked = @total_inventory.map do |item|
  #     item if item[quantity] > 50 && item[vendors].length > 1
  #   end
  #   overstocked.compact
  # end
end
