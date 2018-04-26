class ItemHandler

  def get_adjustments(item)
    method_router(item)
  end

  private

  def method_router(item)
    if item.name == "Aged Brie"
      aged_item(item)
    elsif item.name.include?("Sulfuras")
      legendary_item(item)
    else
      regular_item(item)
    end
  end

  def regular_item(item)
    qualAdj = past_date?(item) ? -2 : -1
    {sellInAdj:-1, qualAdj: qualAdj}
  end

  def aged_item(item)
    qualAdj = past_date?(item) ? -2 : 1
    {sellInAdj:-1, qualAdj: qualAdj}
  end

  def legendary_item(item)
    {sellInAdj: 0, qualAdj: 0}
  end

  def past_date?(item)
    item.sell_in < 0
  end

end
