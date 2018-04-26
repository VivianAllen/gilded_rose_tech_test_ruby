require File.join(File.dirname(__FILE__), '../item_adjustment_handler')
require File.join(File.dirname(__FILE__), '../gilded_rose')

describe ItemAdjustmentHandler do

  let(:handler) { ItemAdjustmentHandler.new() }

  describe "#get_adj" do

    context "regular items" do
      it 'returns {sellInAdj: -1, qualAdj: -1} for a regular object in sell-by date' do
        item = Item.new("foo", 10, 10)
        expected_hsh = {sellInAdj:-1, qualAdj: -1}
        expect(handler.get_adj(item)).to eq(expected_hsh)
      end
      it 'returns {sellInAdj: -1, qualAdj: -2} for a regular object past sell-by date' do
        item = Item.new("foo", 0, 10)
        expected_hsh = {sellInAdj:-1, qualAdj: -2}
        expect(handler.get_adj(item)).to eq(expected_hsh)
      end
    end

    context "aged brie" do
      it 'returns {sellInAdj: -1, qualAdj: 1} for Aged Brie in sell-by date' do
        item = Item.new("Aged Brie", 10, 10)
        expected_hsh = {sellInAdj:-1, qualAdj: 1}
        expect(handler.get_adj(item)).to eq(expected_hsh)
      end
      it 'returns {sellInAdj: -1, qualAdj: 2} for Aged Brie past sell-by date' do
        item = Item.new("Aged Brie", 0, 10)
        expected_hsh = {sellInAdj:-1, qualAdj: 2}
        expect(handler.get_adj(item)).to eq(expected_hsh)
      end
    end

    context "legendary hand of Sulfuras or whatever, nerds" do
      it 'returns {sellInAdj: 0, qualAdj: 0} for Sulfuras' do
        item = Item.new("Sulfuras, Hand of Ragnaros", 0, 80)
        expected_hsh = {sellInAdj:0, qualAdj: 0}
        expect(handler.get_adj(item)).to eq(expected_hsh)
      end
    end

    context "backstage passes" do
      it 'returns {sellInAdj: -1, qualAdj: 1} for a backstage with more than 10 days to go' do
        item = Item.new("Backstage passes", 20, 10)
        expected_hsh = {sellInAdj: -1, qualAdj: 1}
        expect(handler.get_adj(item)).to eq(expected_hsh)
      end
      it 'returns {sellInAdj: -1, qualAdj: 2} for a backstage with 10 days or less to go' do
        item = Item.new("Backstage passes", 10, 10)
        expected_hsh = {sellInAdj: -1, qualAdj: 2}
        expect(handler.get_adj(item)).to eq(expected_hsh)
      end
      it 'returns {sellInAdj: -1, qualAdj: 3} for a backstage with 5 days or less to go' do
        item = Item.new("Backstage passes", 5, 10)
        expected_hsh = {sellInAdj: -1, qualAdj: 3}
        expect(handler.get_adj(item)).to eq(expected_hsh)
      end
    end
    context "conjured items" do
      it 'returns {sellInAdj: -1, qualAdj: -2} for a conjured item' do
        item = Item.new("Conjured whatever", 10, 10)
        expected_hsh = {sellInAdj: -1, qualAdj: 3}
        expect(handler.get_adj(item)).to eq(expected_hsh)
      end
    end
  end
end
