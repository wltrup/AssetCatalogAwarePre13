import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(AssetCatalogAwarePre13Tests.allTests),
    ]
}
#endif
