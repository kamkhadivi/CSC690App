
import XCTest
@testable import ToDoList

var toDoItemTest: BillItem!

class ToDoListTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        
        toDoItemTest = BillItem(title: "Homework", amount: 0)
    }
    
    override func tearDown() {
        super.tearDown()
        
        toDoItemTest = nil
    }
    
    func testTitleSet() {
        XCTAssertEqual(toDoItemTest.title, "Homework")
    }
    
    func testPerformanceExample() {
        self.measure {
            
        }
    }
    
}
