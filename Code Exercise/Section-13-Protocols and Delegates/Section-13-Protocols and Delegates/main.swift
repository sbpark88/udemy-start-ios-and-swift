import Foundation

let emilio = EmergencyCallHandler()
let pete = Paramedic(handler: emilio)
emilio.assesSituation()
emilio.medicalEmergency()

print("-------------------------------")

let byul = Surgeon(handler: emilio)
emilio.assesSituation()
emilio.medicalEmergency()
