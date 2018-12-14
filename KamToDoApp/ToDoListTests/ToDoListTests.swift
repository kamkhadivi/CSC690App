
import XCTest
@testable import ToDoList

var toDoItemTest: ToDoItem!

class ToDoListTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        
        toDoItemTest = ToDoItem(title: "Homework")
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
