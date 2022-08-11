import Foundation

class EmergencyCallHandler {

    var delegate: AdvancedLifeSupport?

    func assesSituation() {
        print("Can you tell me what happend?")
    }

    func medicalEmergency() {
        delegate?.performCPR()
    }

}
