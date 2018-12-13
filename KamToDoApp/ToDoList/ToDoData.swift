
import Foundation

class BillItem: NSObject, NSCoding
{
    var title: String
    var done: Bool
    var amount: Double
    
    required init(title:String, amount: Double) {
        self.title  = title
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

extension BillItem
{
    public class func getMockData() -> [BillItem]
    {
        return [
            BillItem(title: "Xbox Live", amount: 10),
            BillItem(title: "Homework", amount: 20),
            BillItem(title: "Groceries", amount: 35.3),
            BillItem(title: "Clean Kitchen", amount: 12.72),
            BillItem(title: "Street Cleaning", amount: 18.80)
        ]
    }
}


var billList: [BillItem]?


func archiveData(billItem : [BillItem]) -> NSData {
    return NSKeyedArchiver.archivedData(withRootObject: billItem as NSArray) as NSData
}

func saveData(billList: [BillItem]){
    let archivedObject = archiveData(billItem: billList)
    UserDefaults.standard.set(archivedObject, forKey: "todoList")
    UserDefaults.standard.synchronize()
}

func fetchData() -> [BillItem]? {
    if let unarchivedObject = UserDefaults.standard.object(forKey: "billList") as? Data {
        return NSKeyedUnarchiver.unarchiveObject(with: unarchivedObject as Data) as? [BillItem]
    }
    
    return nil
}

