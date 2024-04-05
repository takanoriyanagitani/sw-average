import XCTest

@testable import sw_average

final class avg32fTests: XCTestCase {

  func testEmpty() throws {
    let vals: [Float32] = []
    let avg: Float32? = sw_average.Avg32f(vals: vals)
    XCTAssertEqual(avg, nil)
  }

  func testSingle() throws {
    let vals: [Float32] = [42.0]
    let avg: Float32? = sw_average.Avg32f(vals: vals)
    XCTAssertEqual(avg, 42.0)
  }

  func testDouble() throws {
    let vals: [Float32] = [1.0, 2.0]
    let avg: Float32? = sw_average.Avg32f(vals: vals)
    XCTAssertEqual(avg, 1.5)
  }

  func testIII() throws {
    let vals: [Float32] = [1.0, 2.0, 3.0]
    let avg: Float32? = sw_average.Avg32f(vals: vals)
    XCTAssertEqual(avg, 2.0)
  }

  func testIV() throws {
    let vals: [Float32] = [1.0, 2.0, 3.0, 4.0]
    let avg: Float32? = sw_average.Avg32f(vals: vals)
    XCTAssertEqual(avg, 2.5)
  }

  func testV() throws {
    let vals: [Float32] = [1.0, 2.0, 3.0, 4.0, 5.0]
    let avg: Float32? = sw_average.Avg32f(vals: vals)
    XCTAssertEqual(avg, 3.0)
  }

  func testVI() throws {
    let vals: [Float32] = [1.0, 2.0, 3.0, 4.0, 5.0, 6.0]
    let avg: Float32? = sw_average.Avg32f(vals: vals)
    XCTAssertEqual(avg, 3.5)
  }

}
