import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!

    var tipPercent: Double?/**/
    var people: Double?
    var eachTip: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        totalLabel.text = eachTip
        settingsLabel.text = "Split between \(people!) people, with \(tipPercent!)% tip."
    }

    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true)
    }

}
