import Foundation

class Doctor: AdvancedLifeSupport {

    init(handler: EmergencyCallHandler) {
        handler.delegate = self
    }

    func performCPR() {
        print("The doctor does chest compressions, 30 per second.")
    }

    func useStethescope() {
        print("Listening for heart sounds.")
    }

}
