# iOSUnitTesting

## D'oh!

Did you, by any chance, name your test method `text_something` instead of `test_something`?

## Concepts

* FIRST
   * fast
   * isolated
   * repeatable
   * self-verifying
   * timely
* AAA
   * Arrange
   * Act
   * Assert
* FIRE
   * Fast
   * Isolated
   * Repeatable
   * Easy to test

## CustomStringConvertible

Implement CustomStringConvertible protocol and add a "description" method.

## Asserts

* `class XCTest`
* `func XCTAssert(() -> Bool, () -> String, file: StaticString, line: UInt)`
* `func XCTAssertTrue(() -> Bool, () -> String, file: StaticString, line: UInt)`
* `func XCTAssertFalse(() -> Bool, () -> String, file: StaticString, line: UInt)`
* `func XCTAssertNil(() -> Any?, () -> String, file: StaticString, line: UInt)`
* `func XCTAssertNotNil(() -> Any?, () -> String, file: StaticString, line: UInt)`
* `func XCTUnwrap<T>(() -> T?, () -> String, file: StaticString, line: UInt) -> T`
* `func XCTAssertEqual<T>(() -> T, () -> T, () -> String, file: StaticString, line: UInt)`
* `func XCTAssertNotEqual<T>(() -> T, () -> T, () -> String, file: StaticString, line: UInt)`
* `func XCTAssertIdentical(() -> AnyObject?, () -> AnyObject?, () -> String, file: StaticString, line: UInt)`
* `func XCTAssertNotIdentical(() -> AnyObject?, () -> AnyObject?, () -> String, file: StaticString, line: UInt)`
* `func XCTAssertEqual<T>(() -> T, () -> T, accuracy: T, () -> String, file: StaticString, line: UInt)`
* `func XCTAssertNotEqual<T>(() -> T, () -> T, accuracy: T, () -> String, file: StaticString, line: UInt)`
* `func XCTAssertGreaterThan<T>(() -> T, () -> T, () -> String, file: StaticString, line: UInt)`
* `func XCTAssertGreaterThanOrEqual<T>(() -> T, () -> T, () -> String, file: StaticString, line: UInt)`
* `func XCTAssertLessThanOrEqual<T>(() -> T, () -> T, () -> String, file: StaticString, line: UInt)`
* `func XCTAssertLessThan<T>(() -> T, () -> T, () -> String, file: StaticString, line: UInt)`
* `func XCTAssertThrowsError<T>(() -> T, () -> String, file: StaticString, line: UInt, (Error) -> Void)`
* `func XCTAssertNoThrow<T>(() -> T, () -> String, file: StaticString, line: UInt)`
* `func XCTFail(String, file: StaticString, line: UInt)`
* `func XCTExpectFailure(String?, options: XCTExpectedFailure.Options)`
* `func XCTExpectFailure(String?, enabled: Bool?, strict: Bool?, issueMatcher: ((XCTIssue) -> Bool)?)`
* `func XCTExpectFailure<R>(String?, options: XCTExpectedFailure.Options, failingBlock: () -> R) -> R`
* `func XCTExpectFailure<R>(String?, enabled: Bool?, strict: Bool?, failingBlock: () -> R, issueMatcher: ((XCTIssue) -> Bool)?) -> R`
* `func XCTSkipIf(() -> Bool, () -> String?, file: StaticString, line: UInt)`
* `func XCTSkipUnless(() -> Bool, () -> String?, file: StaticString, line: UInt)`
* `throw XCTSkip("Reason for skipping.")`

## Testing a class

```
@testable import AppTarget

class MyClassTests: XCTestCase {
    func test_methodOne() {
    }
}
```

## Testing View Controllers

`loadViewIfNeeded()`

## Tips

Turn off debugging for unit tests to speed up.

