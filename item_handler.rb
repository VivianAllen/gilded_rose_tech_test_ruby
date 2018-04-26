class ItemHandler

  def get_adjustments(item)
    method_router(item)
  end

  private

  def method_router(item)
    case item.name
    when "Aged Brie"
      aged_brie(item)
    else
      regular_item(item)
    end
  end

  def regular_item(item)
    qualAdj = past_date?(item) ? -2 : -1
    {sellInAdj:-1, qualAdj: qualAdj}
  end

  def aged_brie(item)
    qualAdj = past_date?(item) ? -2 : 1
    {sellInAdj:-1, qualAdj: qualAdj}
  end

  def past_date?(item)
    item.sell_in < 0
  end

end
