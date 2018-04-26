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
    {sellInAdj: -1, qualAdj: 1}
  end

  # def get_backstage_pass_quality_adj(item)
  #   case item.sell_in
  #   when >10
  # end

  def past_date?(item)
    item.sell_in < 0
  end

end
