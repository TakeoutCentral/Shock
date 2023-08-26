//  String+PathMatchingTests.swift

import XCTest
@testable import Shock

class String_PathMatchingTests: XCTestCase {

    func testNoTokenPathsMatch() {
        let path = "/some/path"
        let otherPath = "/some/path"
        XCTAssertTrue(path.pathMatches(otherPath))
    }
    
    func testNoTokenPathsDoNotMatch() {
        let path = "/some/path"
        let otherPath = "/some/otherpath"
        XCTAssertFalse(path.pathMatches(otherPath))
    }
    
    func testColonBasedTokenPathsMatch() {
        let path = "/some/:path"
        let otherPath = "/some/path"
        XCTAssertTrue(path.pathMatches(otherPath))
        XCTAssertTrue(otherPath.pathMatches(path))
    }
    
    func testColonBasedTokenPathsDoNotMatch() {
        let path = "/some/:path"
        let otherPath = "/someOther/path"
        XCTAssertFalse(path.pathMatches(otherPath))
    }
    
    func testCurlyBracketBasedTokenPathsMatch() {
        let path = "/some/{path}"
        let otherPath = "/some/path"
        XCTAssertTrue(path.pathMatches(otherPath))
        XCTAssertTrue(otherPath.pathMatches(path))
    }
    
    func testCurlyBracketBasedTokenPathsDoNotMatch() {
        let path = "/some/{path}"
        let otherPath = "/someOther/path"
        XCTAssertFalse(path.pathMatches(otherPath))
    }
}
