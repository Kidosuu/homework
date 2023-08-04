@testable import GildedRose
import XCTest

class GildedRoseTests: XCTestCase {
    func testFoo() throws {
        let items = [Item(name: "foo", sellIn: 0, quality: 0), Item(name: "Aged Brie", sellIn: 2, quality: 10)]
        let app = GildedRose(items: items)
        app.updateQuality()
        XCTAssertEqual(app.items[1].name, "Aged Brie")
        XCTAssertEqual(app.items[1].sellIn, 1)
        XCTAssertEqual(app.items[1].quality, 11)
    }
}
