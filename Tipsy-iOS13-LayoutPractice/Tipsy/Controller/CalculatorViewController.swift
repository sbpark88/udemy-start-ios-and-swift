import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet var tipPercentButton: [UIButton]!
    @IBOutlet weak var splitNumberLabel: UILabel!

    var tipCalculator: TipCalculator?

    override func viewDidLoad() {
        super.viewDidLoad()

        tipCalculator = TipCalculator(
                billTotal: 0.0,
                tipPercent: Double(splitNumberLabel.text!)!,
                people: Double(splitNumberLabel.text!)!
        )
    }

    @IBAction func tipChanged(_ sender: UIButton) {
        tipPercentButton.forEach { button in
            if button.tag == sender.tag {
                button.isSelected = true
                tipCalculator?.setTipPercent(sender.tag)
            } else {
                button.isSelected = false
            }
        }
    }

    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        tipCalculator?.setPeople(split: sender.value)
    }

    @IBAction func calculatePressed(_ sender: UIButton) {
        guard let billTotal = billTextField.text else {
            fatalError("guard failure handling has not been implemented")
        }
        tipCalculator?.setBillTotal(billTotal)
        billTextField.endEditing(true)  // focus out

        performSegue(withIdentifier: "segueToResult", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)

        if segue.identifier == "segueToResult" {
            guard let resultView: ResultViewController = segue.destination as? ResultViewController else {
                return
            }

            resultView.tipPercent = tipCalculator?.tipPercent
            resultView.people = tipCalculator?.people
            resultView.eachTip = tipCalculator?.calculateTip()
        }

    }

}
