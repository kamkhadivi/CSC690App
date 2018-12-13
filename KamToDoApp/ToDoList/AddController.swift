
import UIKit
import UserNotifications

class AddController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var amount: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge], completionHandler: {
                granted, error in    })
    }

    @IBAction func sendNote() {
        if (textField.text != nil) && textField.text != "" {
            let content = UNMutableNotificationContent()
            content.title = "Bill Due: \(textField.text!)"
            content.subtitle = "$\(amount.text!)"
            content.body = ""
            content.badge = 1
            content.sound = UNNotificationSound.default()
        
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
            let requestIdentifier = "BillReminders"
            let request = UNNotificationRequest(identifier: requestIdentifier, content: content, trigger: trigger)
            UNUserNotificationCenter.current().add(request, withCompletionHandler: { error in
            // handle error
            })
        }
    }
    
    @IBAction func addPressed(_ sender: UIButton) {

        if (textField.text != nil) && textField.text != "" {
            

            let billItem = BillItem(title: textField.text!, amount: Double(amount.text!)!)
            billList?.append(billItem)
            
            
            
            textField.text = ""
            amount.text = ""
            textField.placeholder = "Add more?"
        }
    }

}
