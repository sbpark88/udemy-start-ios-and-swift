import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet var tipPercentButton: [UIButton]!
    @IBOutlet weak var splitNumberLabel: UILabel!

    @IBAction func tipChanged(_ sender: UIButton) {
        tipPercentButton.forEach { button in
            button.isSelected = (button.tag == sender.tag) ? true : false
        }
    }

    @IBAction func stepperValueChanged(_ sender: UIStepper) {
    }

    @IBAction func calculatePressed(_ sender: UIButton) {
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
    }

}
