class ItemHandler

  def get_adjustments(item)
    method_router(item)
  end

  private

  def method_router(item)
    regular_item(item)
  end

  def regular_item(item)
    qualAdj = past_date?(item) ? -2 : -1
    {sellInAdj:-1, qualAdj: qualAdj}
  end

  def past_date?(item)
    item.sell_in < 0
  end

end
