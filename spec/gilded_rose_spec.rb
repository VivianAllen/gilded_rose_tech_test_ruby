require File.join(File.dirname(__FILE__), '../gilded_rose')

describe GildedRose do

  let(:mock_handler_class) {
    double :mock_item_adjustment_handler_class,
    new: mock_handler
  }
  let(:mock_handler) {
    double :mock_item_adjustment_handler,
    get_adjustments: {sellInAdj:-1, qualAdj: -1}
  }

  describe "#update_quality" do
    it "does not change the name" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items, mock_handler_class).update_quality()
      expect(items[0].name).to eq "foo"
    end
    it "applies adjustments" do
      items = [Item.new("foo", 1, 1)]
      GildedRose.new(items, mock_handler_class).update_quality()
      expect(items[0].sell_in).to eq 0
      expect(items[0].quality).to eq 0
    end

  end

  describe "#adjust_quality" do
    it "will not adjust quality to below zero" do
      item = Item.new("foo", 0, 0)
      GildedRose.new(item).adjust_quality(item, -1)
      expect(item.quality).to eq(0)
    end
    it "will floor quality to zero" do
      item = Item.new("foo", 10, 10)
      GildedRose.new(item).adjust_quality(item, -20)
      expect(item.quality).to eq(0)
    end
    it "will ceiling quality to 50" do
      item = Item.new("foo", 10, 10)
      GildedRose.new(item).adjust_quality(item, 50)
      expect(item.quality).to eq(50)
    end
    it "can handle above-envelope high-quality static-quality items" do
      item = Item.new("foo", 10, 80)
      GildedRose.new(item).adjust_quality(item, 0)
      expect(item.quality).to eq(80)
    end
  end

end
