require File.join(File.dirname(__FILE__), '../gilded_rose')
require_relative 'golden_master'
include GoldenMaster

describe GildedRose do

  describe "#update_quality" do
    it "does not change the name" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "foo"
    end
    it "matches the golden master (no conjured objects)" do
      expect(generate_GM(ITEMS_NO_CONJURED)).to eq(GM_4_DAYS_NO_CONJURED)
    end
  end

  describe "#adjust_quality" do
    it "will not adjust quality to below zero" do
      item = Item.new("foo", 0, 0)
      GildedRose.new(item).adjust_quality(item, -1)
      expect(item.quality).to eq(0)
    end
  end

end
