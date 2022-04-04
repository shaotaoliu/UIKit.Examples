import UIKit
import UserNotifications

class NotificationViewController: UIViewController {

    @IBOutlet weak var notifyButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // NOTE: you need to switch from the app to the main UI
    // in order to see the notification
    
    @IBAction func notify(_ sender: Any) {
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            if success {
                let content = UNMutableNotificationContent()
                content.title = "Hello World"
                content.body = "This is a test from Jason."
                content.sound = .default
                
//                let date = Date(timeIntervalSinceNow: 1)
//                let trigger = UNCalendarNotificationTrigger(
//                    dateMatching: Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date),
//                    repeats: false)
                
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                
                center.add(request)
            }
        }
    }
    
}
