class ItemAdjustmentHandler

  def get_adjustments(item)
    method_router(item)
  end

  private

  def method_router(item)
    name = item.name.downcase
    if name.include?("aged brie")
      maturing_item(item)
    elsif name.include?("sulfuras")
      static_item(item)
    elsif name.include?("backstage passes")
      time_critical_item(item)
    else
      regular_item(item)
    end
  end

  def regular_item(item)
    qualAdj = past_date?(item) ? -2 : -1
    {sellInAdj:-1, qualAdj: qualAdj}
  end

  def maturing_item(item)
    qualAdj = past_date?(item) ? -2 : 1
    {sellInAdj:-1, qualAdj: qualAdj}
  end

  def static_item(item)
    {sellInAdj: 0, qualAdj: 0}
  end

  def time_critical_item(item)
    {sellInAdj: -1, qualAdj: get_time_crit_adj(item)}
  end

  def get_time_crit_adj(item)
    date = item.sell_in
    if date > 10
      return 1
    elsif date > 5
      return 2
    else
      return 3
    end
  end

  def past_date?(item)
    item.sell_in < 0
  end

end
