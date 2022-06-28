import UIKit

struct User {
    let name: String
    var email: String?
    var followers: Int
    var isActive: Bool
    
    init(name: String, email: String?, followers: Int, isActive: Bool) {
        self.name = name
        self.email = email
        self.followers = followers
        self.isActive = isActive
    }
    
    func logStatus() -> Void {
        self.isActive
        ? print("\(self.name) is working hard")
        : print("\(self.name) has left earth")
    }
}

var aUser = User(name: "Richard", email: nil, followers: 0, isActive: false)
aUser.logStatus()
