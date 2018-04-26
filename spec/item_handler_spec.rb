require File.join(File.dirname(__FILE__), '../item_handler')
require File.join(File.dirname(__FILE__), '../gilded_rose')

describe ItemHandler do

  let(:handler) { ItemHandler.new() }

  describe "#get_adjustments" do

    context "regular items" do
      it '# returns {sellInAdj: -1, qualAdj: -1} for a regular object in sell-by date' do
        item = [Item.new("foo", 10, 10)]
        expected_hsh = {sellInAdj:-1, qualAdj: -1}
        expect(handler.get_adjustments(item)).to eq(expected_hsh)
      end
      it '# returns {sellInAdj: -1, qualAdj: -2} for a regular object past sell-by date' do
        item = [Item.new("foo", -1, 10)]
        expected_hsh = {sellInAdj:-1, qualAdj: -2}
        expect(handler.get_adjustments(item)).to eq(expected_hsh)
      end
    end
  end

end
