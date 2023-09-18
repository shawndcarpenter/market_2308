require './lib/item'

class Vendor
  attr_reader :name, :inventory

  def initialize(name)
    @name = name
    @inventory = {}
  end

  def stock(item, stock)
    if @inventory.include?(item)
      @inventory[item] += stock
    else
      @inventory[item] = stock
    end
  end
  
  def check_stock(item)
    if !@inventory.include?(item)
      0
    else
      @inventory[item]
    end
  end

  def potential_revenue
    revenue = @inventory.map do |item|
      item.first.price * item.last.to_f
    end
    revenue.sum
  end
end