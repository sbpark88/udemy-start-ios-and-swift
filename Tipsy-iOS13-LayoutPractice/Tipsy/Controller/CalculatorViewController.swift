import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet var tipPercentButton: [UIButton]!
    @IBOutlet weak var splitNumberLabel: UILabel!
    let numberRegex: String = "^(0?\\.\\d+|[1-9]\\d*\\.?\\d*)$"

    @IBAction func tipChanged(_ sender: UIButton) {
        tipPercentButton.forEach { button in
            button.isSelected = (button.tag == sender.tag) ? true : false
        }
    }

    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
    }

    @IBAction func calculatePressed(_ sender: UIButton) {
        guard let billTotal = billTextField.text else {
            fatalError("guard failure handling has not been implemented")
        }

        billTextField.endEditing(true)  // focus out

        // 'billTotal' can pass the guard let condition when ""(empty string)
        // Therefore, we must check it.
        // In this code, I used regex to check is it number format.
        if billTotal.range(of: numberRegex, options: .regularExpression) != nil {
            var eachTip: Double = 0.0
            tipPercentButton.forEach { button in
                if button.isSelected {
                    eachTip = Double(billTotal)! * (Double(button.tag) / 100) / Double(splitNumberLabel.text!)!
                }
            }

            print(String(format: "%.2f", eachTip))
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
    }

}
