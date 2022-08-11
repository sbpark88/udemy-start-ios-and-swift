import Foundation

class Surgeon: Doctor {

    override func performCPR() {
        super.performCPR()
        print("Sings staying alive by the BeeGees.")
    }

    func useStetthescope() {
        print("Whirr...")
    }

}
