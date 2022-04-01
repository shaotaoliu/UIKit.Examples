import UIKit

class Global {
    
    static let main = Global()
    
    func images(count: Int) -> [UIImage] {
        (1...count).map { i in
            UIImage(named: "image\(i)")!
        }
    }
}
