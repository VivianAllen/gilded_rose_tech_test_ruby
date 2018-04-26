require File.join(File.dirname(__FILE__), '../gilded_rose')
require_relative 'golden_master'
include GoldenMaster

describe GildedRose do
  context "intgrated gilded rose system" do
    it "matches the golden master (no conjured objects)" do
      expect(generate_GM(4, ITEMS_NO_CONJURED)).to eq(GM_4_DAYS_NO_CONJURED)
    end
  end
end
