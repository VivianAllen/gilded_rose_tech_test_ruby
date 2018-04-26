require_relative 'item_adjustment_handler'

class GildedRose

  MIN_QUALITY = 0
  MAX_QUALITY = 50

  def initialize(items, handler_class=ItemAdjustmentHandler)
    @items = items
    @handler = handler_class.new  end


  def update_quality()
    @items.each do |item|
      adj = @handler.get_adj(item)
      adj_sell_in(item, adj[:sellInAdj])
      adj_quality(item, adj[:qualAdj])
    end
  end

  def adj_quality(item, adj)
    item.quality += legalize_adj(item, adj)
  end

  private

  def adj_sell_in(item, adj)
    item.sell_in += adj
  end

  def legalize_adj(item, adj)
    return adj if legal_adj?(item, adj)
    return item.quality*-1 if adj_too_low?(item, adj)
    return MAX_QUALITY - item.quality if adj_too_high?(item, adj)
  end

  def legal_adj?(item, adj)
    !adj_too_high?(item, adj) && !adj_too_low?(item, adj)
  end

  def adj_too_high?(item, adj)
    item.quality + adj >= MAX_QUALITY && item.quality <= MAX_QUALITY
  end

  def adj_too_low?(item, adj)
    item.quality + adj <= MIN_QUALITY
  end
end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
