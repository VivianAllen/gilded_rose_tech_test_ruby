require File.join(File.dirname(__FILE__), '../gilded_rose')

module GoldenMaster

ITEMS_NO_CONJURED = [
  Item.new(name="+5 Dexterity Vest", sell_in=10, quality=20),
  Item.new(name="Aged Brie", sell_in=2, quality=0),
  Item.new(name="Elixir of the Mongoose", sell_in=5, quality=7),
  Item.new(name="Sulfuras, Hand of Ragnaros", sell_in=0, quality=80),
  Item.new(name="Sulfuras, Hand of Ragnaros", sell_in=-1, quality=80),
  Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=15, quality=20),
  Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=10, quality=49),
  Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=5, quality=49),
]

ITEMS_W_CONJURED = [
  Item.new(name="+5 Dexterity Vest", sell_in=10, quality=20),
  Item.new(name="Aged Brie", sell_in=2, quality=0),
  Item.new(name="Elixir of the Mongoose", sell_in=5, quality=7),
  Item.new(name="Sulfuras, Hand of Ragnaros", sell_in=0, quality=80),
  Item.new(name="Sulfuras, Hand of Ragnaros", sell_in=-1, quality=80),
  Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=15, quality=20),
  Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=10, quality=49),
  Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=5, quality=49),
  # This Conjured item does not work properly yet
  Item.new(name="Conjured Mana Cake", sell_in=3, quality=6), # <-- :O
]

GM_1_DAY_NO_CONJURED = [
  "-------- day 0 --------",
  "name, sellIn, quality",
  "+5 Dexterity Vest 10 20",
  "Aged Brie 2 0",
  "Elixir of the Mongoose 5 7",
  "Sulfuras, Hand of Ragnaros 0 80",
  "Sulfuras, Hand of Ragnaros -1 80",
  "Backstage passes to a TAFKAL80ETC concert 15 20",
   "Backstage passes to a TAFKAL80ETC concert 10 49",
   "Backstage passes to a TAFKAL80ETC concert 5 49",
   "",
]


GM_2_DAYS_NO_CONJURED = [
  "-------- day 0 --------",
  "name, sellIn, quality",
  "+5 Dexterity Vest 10 20",
  "Aged Brie 2 0",
  "Elixir of the Mongoose 5 7",
  "Sulfuras, Hand of Ragnaros 0 80",
  "Sulfuras, Hand of Ragnaros -1 80",
  "Backstage passes to a TAFKAL80ETC concert 15 20",
   "Backstage passes to a TAFKAL80ETC concert 10 49",
   "Backstage passes to a TAFKAL80ETC concert 5 49",
   "",
   "-------- day 1 --------",
   "name, sellIn, quality",
   "+5 Dexterity Vest 9 19",
   "Aged Brie 1 1",
   "Elixir of the Mongoose 4 6",
  "Sulfuras, Hand of Ragnaros 0 80",
  "Sulfuras, Hand of Ragnaros -1 80",
  "Backstage passes to a TAFKAL80ETC concert 14 21",
  "Backstage passes to a TAFKAL80ETC concert 9 50",
  "Backstage passes to a TAFKAL80ETC concert 4 50",
  "",
]

GM_3_DAYS_NO_CONJURED = [
  "-------- day 0 --------",
  "name, sellIn, quality",
  "+5 Dexterity Vest 10 20",
  "Aged Brie 2 0",
  "Elixir of the Mongoose 5 7",
  "Sulfuras, Hand of Ragnaros 0 80",
  "Sulfuras, Hand of Ragnaros -1 80",
  "Backstage passes to a TAFKAL80ETC concert 15 20",
   "Backstage passes to a TAFKAL80ETC concert 10 49",
   "Backstage passes to a TAFKAL80ETC concert 5 49",
   "",
   "-------- day 1 --------",
   "name, sellIn, quality",
   "+5 Dexterity Vest 9 19",
   "Aged Brie 1 1",
   "Elixir of the Mongoose 4 6",
  "Sulfuras, Hand of Ragnaros 0 80",
  "Sulfuras, Hand of Ragnaros -1 80",
  "Backstage passes to a TAFKAL80ETC concert 14 21",
  "Backstage passes to a TAFKAL80ETC concert 9 50",
  "Backstage passes to a TAFKAL80ETC concert 4 50",
  "",
  "-------- day 2 --------",
  "name, sellIn, quality",
  "+5 Dexterity Vest 8 18",
  "Aged Brie 0 2",
  "Elixir of the Mongoose 3 5",
  "Sulfuras, Hand of Ragnaros 0 80",
  "Sulfuras, Hand of Ragnaros -1 80",
  "Backstage passes to a TAFKAL80ETC concert 13 22",
  "Backstage passes to a TAFKAL80ETC concert 8 50",
  "Backstage passes to a TAFKAL80ETC concert 3 50",
  "",
]

GM_4_DAYS_NO_CONJURED = [
  "-------- day 0 --------",
  "name, sellIn, quality",
  "+5 Dexterity Vest 10 20",
  "Aged Brie 2 0",
  "Elixir of the Mongoose 5 7",
  "Sulfuras, Hand of Ragnaros 0 80",
  "Sulfuras, Hand of Ragnaros -1 80",
  "Backstage passes to a TAFKAL80ETC concert 15 20",
   "Backstage passes to a TAFKAL80ETC concert 10 49",
   "Backstage passes to a TAFKAL80ETC concert 5 49",
   "",
   "-------- day 1 --------",
   "name, sellIn, quality",
   "+5 Dexterity Vest 9 19",
   "Aged Brie 1 1",
   "Elixir of the Mongoose 4 6",
  "Sulfuras, Hand of Ragnaros 0 80",
  "Sulfuras, Hand of Ragnaros -1 80",
  "Backstage passes to a TAFKAL80ETC concert 14 21",
  "Backstage passes to a TAFKAL80ETC concert 9 50",
  "Backstage passes to a TAFKAL80ETC concert 4 50",
  "",
  "-------- day 2 --------",
  "name, sellIn, quality",
  "+5 Dexterity Vest 8 18",
  "Aged Brie 0 2",
  "Elixir of the Mongoose 3 5",
  "Sulfuras, Hand of Ragnaros 0 80",
  "Sulfuras, Hand of Ragnaros -1 80",
  "Backstage passes to a TAFKAL80ETC concert 13 22",
  "Backstage passes to a TAFKAL80ETC concert 8 50",
  "Backstage passes to a TAFKAL80ETC concert 3 50",
  "",
  "-------- day 3 --------",
  "name, sellIn, quality",
  "+5 Dexterity Vest 7 17",
  "Aged Brie -1 4",
  "Elixir of the Mongoose 2 4",
  "Sulfuras, Hand of Ragnaros 0 80",
  "Sulfuras, Hand of Ragnaros -1 80",
  "Backstage passes to a TAFKAL80ETC concert 12 23",
  "Backstage passes to a TAFKAL80ETC concert 7 50",
  "Backstage passes to a TAFKAL80ETC concert 2 50",
  ""
]

def generate_GM(days=4, items)
  gilded_rose = GildedRose.new items
  output = []
  (0...days).each do |day|
    output.push("-------- day #{day} --------")
    output.push("name, sellIn, quality")
    items.each do |item|
      output.push("#{item.name} #{item.sell_in} #{item.quality}")
    end
    output.push("")
    gilded_rose.update_quality
  end
  output
end

end
