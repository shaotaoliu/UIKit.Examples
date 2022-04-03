import UIKit
import UserNotifications

class NotificationViewController: UIViewController {

    @IBOutlet weak var notifyButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func notify(_ sender: Any) {
        let center = UNUserNotificationCenter.current()
        
        center.requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            if success {
                center.removeAllPendingNotificationRequests()
                
                let content = UNMutableNotificationContent()
                content.title = "Hello World"
                content.sound = .default
                content.body = "Hello! It is nice to see you!"
                
//                let date = Date(timeIntervalSinceNow: 1)
//                let trigger = UNCalendarNotificationTrigger(
//                    dateMatching: Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date),
//                    repeats: false)
                
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
                
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                center.add(request)
            }
        }
    }
    
}
