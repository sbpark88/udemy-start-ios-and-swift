import Foundation

struct Paramedic: AdvancedLifeSupport {

    init(handler: EmergencyCallHandler) {
        handler.delegate = self
    }

    func performCPR() {
        print("The paramedic does chest compressions, 30 per second.")
    }

}
