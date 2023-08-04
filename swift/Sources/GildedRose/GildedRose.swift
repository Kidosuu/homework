public class GildedRose {
    var items: [Item]

    public init(items: [Item]) {
        self.items = items
    }

    public func updateQuality() {
        for i in 0 ..< items.count {
            updateQualityForEach(i: i)
        }
    }
    
    private func updateQualityForEach(i: Int) {
        switch items[i].name {
        case "Aged Brie":
            updateForAgedBrie(i: i)
        case "Backstage passes to a TAFKAL80ETC concert":
            updateForBackstage(i: i)
        case "Sulfuras, Hand of Ragnaros":
            updateForSulfuras(i: i)
        case "Conjured":
            updateForConjured(i: i)
        default:
            updateForNormalGood(i: i)
        }
    }
        
    private func updateForAgedBrie(i: Int) {
        items[i].quality += 1
        if items[i].sellIn < 0 {
            items[i].quality = items[i].quality + 1
        }
        items[i].quality = min(items[i].quality, 50)
        items[i].sellIn -= 1
    }
    
    private func updateForBackstage(i: Int) {
        items[i].quality += 1
        if items[i].sellIn < 11 {
            items[i].quality += 1
        }
        if items[i].sellIn < 6 {
            items[i].quality += 1
        }
        if items[i].sellIn < 0 {
            items[i].quality = 0
        }
        items[i].quality = min(items[i].quality, 50)
        items[i].sellIn -= 1
    }
    
    private func updateForSulfuras(i: Int) {
        //nothing todo
    }
    
    private func updateForConjured(i: Int) {
        items[i].quality -= 2
        if items[i].sellIn < 0 {
            items[i].quality -= 2
        }
        items[i].quality = max(items[i].quality, 0)
        items[i].sellIn -= 1
    }
    
    private func updateForNormalGood(i: Int) {
        items[i].quality -= 1
        if items[i].sellIn < 0 {
            items[i].quality -= 1
        }
        items[i].quality = max(items[i].quality, 0)
        items[i].sellIn -= 1
    }
}
