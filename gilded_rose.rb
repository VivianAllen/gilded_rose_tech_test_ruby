class GildedRose

  MIN_QUALITY = 0
  MAX_QUALITY = 50

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      if item.name != "Aged Brie" and item.name != "Backstage passes to a TAFKAL80ETC concert"
        if item.name != "Sulfuras, Hand of Ragnaros"
          adjust_quality(item, -1)
        end
      else
        if item.quality < 50
          item.quality = item.quality + 1
          if item.name == "Backstage passes to a TAFKAL80ETC concert"
            if item.sell_in < 11
              if item.quality < 50
                item.quality = item.quality + 1
              end
            end
            if item.sell_in < 6
              if item.quality < 50
                item.quality = item.quality + 1
              end
            end
          end
        end
      end
      if item.name != "Sulfuras, Hand of Ragnaros"
        item.sell_in = item.sell_in - 1
      end
      if item.sell_in < 0
        if item.name != "Aged Brie"
          if item.name != "Backstage passes to a TAFKAL80ETC concert"
            if item.quality > 0
              if item.name != "Sulfuras, Hand of Ragnaros"
                item.quality = item.quality - 1
              end
            end
          else
            item.quality = item.quality - item.quality
          end
        else
          if item.quality < 50
            item.quality = item.quality + 1
          end
        end
      end
    end
  end

  def adjust_quality(item, adj)
    item.quality += legalize_adj(item, adj)
  end

  private

  def legalize_adj(item, adj)
    return adj if legal_adj?(item, adj)
    return item.quality*-1 if adj_too_low?(item, adj)
    return MAX_QUALITY - item.quality if adj_too_high?(item, adj)
  end

  def legal_adj?(item, adj)
    !adj_too_high?(item, adj) && !adj_too_low?(item, adj)
  end

  def adj_too_high?(item, adj)
    item.quality + adj >= MAX_QUALITY
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
