class ItemHandler

  def get_adjustments(item)
    method_router(item)
  end

  private

  def method_router(item)
    regular_item(item)
  end

  def regular_item(item)
    {sellInAdj:-1, qualAdj: -1}
  end

end
