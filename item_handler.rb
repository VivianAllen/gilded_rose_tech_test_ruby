class ItemHandler

  def get_adjustments(item)
    method_router(item)
  end

  private

  def method_router(item)
    name = item.name.downcase
    if name.include?("aged brie")
      aged_item(item)
    elsif name.include?("sulfuras")
      legendary_item(item)
    elsif name.include?("backstage passes")
      backstage_pass(item)
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

  def backstage_pass(item)
    {sellInAdj: -1, qualAdj: get_pass_adj(item)}
  end

  def get_pass_adj(item)
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
