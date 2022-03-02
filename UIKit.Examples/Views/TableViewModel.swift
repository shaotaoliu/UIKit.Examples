import Foundation

class TableViewModel {
    
    var items: [Int] = []
    
    func loadNext() {
        let maxNum = items.max() ?? 0
        
        (1...20).forEach { i in
            items.append(maxNum + i)
        }
    }
}
