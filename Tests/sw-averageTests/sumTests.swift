import XCTest

@testable import sw_average

final class sum32fTests: XCTestCase {

  func testEmpty() throws {
    let vals: [Float32] = []
    let tot: Float32 = sw_average.Sum32f(vals: vals)
    XCTAssertEqual(tot, 0.0)
  }

  func testSingle() throws {
    let vals: [Float32] = [3.776]
    let tot: Float32 = sw_average.Sum32f(vals: vals)
    XCTAssertEqual(tot, 3.776)
  }

  func testDouble() throws {
    let vals: [Float32] = [634.0, 333.0]
    let tot: Float32 = sw_average.Sum32f(vals: vals)
    XCTAssertEqual(tot, 967.0)
  }

  func testIII() throws {
    let vals: [Float32] = [634.0, 333.0, 42.0]
    let tot: Float32 = sw_average.Sum32f(vals: vals)
    XCTAssertEqual(tot, 1009.0)
  }

}

final class sumIf32fTests: XCTestCase {

  func testEmpty() throws {
    let vals: [Float32] = []
    let f: (Float32) -> Bool = { _ in true }
    let tot: Float32 = sw_average.SumIf32f(vals: vals, filter: f)
    XCTAssertEqual(tot, 0.0)
  }

  func testSingle() throws {
    let vals: [Float32] = [3.14]
    let f: (Float32) -> Bool = { _ in true }
    let tot: Float32 = sw_average.SumIf32f(vals: vals, filter: f)
    XCTAssertEqual(tot, 3.14)
  }

  func testSingleFalse() throws {
    let vals: [Float32] = [3.14]
    let f: (Float32) -> Bool = { _ in false }
    let tot: Float32 = sw_average.SumIf32f(vals: vals, filter: f)
    XCTAssertEqual(tot, 0.0)
  }

  func test1km() throws {
    let vals: [Float32] = [3.776, 0.599, 42.195]
    let f: (Float32) -> Bool = { f in 1.0 <= f }
    let tot: Float32 = sw_average.SumIf32f(vals: vals, filter: f)
    XCTAssertEqual(tot, 45.971)
  }

  func test100m() throws {
    let vals: [Float32] = [634.0, 333.0, 42.0]
    let f: (Float32) -> Bool = { f in 100.0 <= f }
    let tot: Float32 = sw_average.SumIf32f(vals: vals, filter: f)
    XCTAssertEqual(tot, 967.0)
  }

}

final class sumBound32fTests: XCTestCase {

  func testEmpty() throws {
    let vals: [Float32] = []
    let lbi: Float32 = 0.6
    let ube: Float32 = 331.3
    let tot: Float32 = sw_average.SumBound32f(vals: vals, lbi: lbi, ube: ube)
    XCTAssertEqual(tot, 0.0)
  }

  func testSingle() throws {
    let vals: [Float32] = [42.0]
    let lbi: Float32 = 0.6
    let ube: Float32 = 331.3
    let tot: Float32 = sw_average.SumBound32f(vals: vals, lbi: lbi, ube: ube)
    XCTAssertEqual(tot, 42.0)
  }

  func testSingleFalse() throws {
    let vals: [Float32] = [-1.0]
    let lbi: Float32 = 0.6
    let ube: Float32 = 331.3
    let tot: Float32 = sw_average.SumBound32f(vals: vals, lbi: lbi, ube: ube)
    XCTAssertEqual(tot, 0.0)
  }

  func testDouble() throws {
    let vals: [Float32] = [3.776, 0.599]
    let lbi: Float32 = 0.6
    let ube: Float32 = 331.3
    let tot: Float32 = sw_average.SumBound32f(vals: vals, lbi: lbi, ube: ube)
    XCTAssertEqual(tot, 3.776)
  }

  func testIII() throws {
    let vals: [Float32] = [634.0, 333.0, 42.0]
    let lbi: Float32 = 0.6
    let ube: Float32 = 331.3
    let tot: Float32 = sw_average.SumBound32f(vals: vals, lbi: lbi, ube: ube)
    XCTAssertEqual(tot, 42.0)
  }

}
