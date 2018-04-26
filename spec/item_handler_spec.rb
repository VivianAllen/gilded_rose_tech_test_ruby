require File.join(File.dirname(__FILE__), '../item_handler')
require File.join(File.dirname(__FILE__), '../gilded_rose')

describe ItemHandler do

  let(:handler) { ItemHandler.new() }

  describe "#get_adjustments" do
    it '# returns {sellInAdj:-1, qualAdj: -1} for a regular object' do
      item = [Item.new("foo", 0, 0)]
      expected_hsh = {sellInAdj:-1, qualAdj: -1}
      expect(handler.get_adjustments(item)).to eq(expected_hsh)
    end
  end

end
