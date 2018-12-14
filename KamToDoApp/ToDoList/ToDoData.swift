
import Foundation

class ToDoItem: NSObject, NSCoding
{
    var title: String
    var done: Bool
    var amount: Double
    
    required init(title:String, amount: Double) {
        self.title = title
        self.amount = amount
        self.done = false
    }
    
    required init(coder aDecoder: NSCoder) {
        self.title = (aDecoder.decodeObject(forKey: "title") as? String)!
        self.amount = aDecoder.decodeDouble(forKey: "amount")
        self.done = aDecoder.decodeBool(forKey: "done")
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(self.title, forKey: "title")
        aCoder.encode(self.amount, forKey: "amount")
        aCoder.encode(self.done, forKey: "done")
    }
}

extension ToDoItem
{
    public class func getMockData() -> [ToDoItem]
    {
        return [
            ToDoItem(title: "Xbox Live", amount: 59.99),
            ToDoItem(title: "Groceries", amount: 47.64),
            ToDoItem(title: "Hulu", amount: 14.99),
            ToDoItem(title: "Gas", amount: 28.34)
        ]
    }
}

var todoList: [ToDoItem]?

func archiveData(todoItem : [ToDoItem]) -> NSData {
    return NSKeyedArchiver.archivedData(withRootObject: todoItem as NSArray) as NSData
}

func saveData(todoList: [ToDoItem]){
    let archivedObject = archiveData(todoItem: todoList)
    UserDefaults.standard.set(archivedObject, forKey: "todoList")
    UserDefaults.standard.synchronize()
}

func fetchData() -> [ToDoItem]? {
    if let unarchivedObject = UserDefaults.standard.object(forKey: "todoList") as? Data {
        return NSKeyedUnarchiver.unarchiveObject(with: unarchivedObject as Data) as? [ToDoItem]
    }
    
    return nil
}
