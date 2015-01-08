//  ViewController.swift
//  Tara_Tip_Calc
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var tipCustomLabel: UILabel!
    @IBOutlet weak var totalCustomLabel: UILabel!
    @IBOutlet weak var customTipPercentLabel2: UILabel!
    @IBOutlet weak var total15Label: UILabel!
    @IBOutlet weak var tip15label: UILabel!
    @IBOutlet weak var customTipPercentageSlider: UISlider!
    @IBOutlet weak var customTipPercentLabel1: UILabel!
    @IBOutlet weak var billAmountLabel: UILabel!
    
    
    let decimal100 = NSDecimalNumber(string: "100.0")
    let decimal15Percent = NSDecimalNumber(string: "0.15")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputTextField.becomeFirstResponder()
    }
    @IBAction func calculateTip(sender: AnyObject) {
        let inputString = inputTextField.text
        
        let sliderValue = NSDecimalNumber(integer: Int(customTipPercentageSlider.value))
        
        let customPercent = sliderValue / decimal100
        
        if sender is UISlider {
            
            customTipPercentLabel1.text = NSNumberFormatter.localizedStringFromNumber(customPercent, numberStyle: NSNumberFormatterStyle.PercentStyle)
            customTipPercentLabel2.text = customTipPercentLabel1.text
        }
        
        if !inputString.isEmpty {
            let billAmount = NSDecimalNumber(string: inputString) / decimal100
            
            if sender is UITextField {
                billAmountLabel.text = " " + formatAsCurrency(billAmount)
                
                let fifteenTip = billAmount * decimal15Percent
                tip15label.text = formatAsCurrency(fifteenTip)
                total15Label.text = formatAsCurrency(billAmount + fifteenTip)
            }
            
            let customTip = billAmount * customPercent
            tipCustomLabel.text = formatAsCurrency(customTip)
            totalCustomLabel.text = formatAsCurrency(billAmount + customTip)
        }
        else {
            billAmountLabel.text = ""
            tip15label.text = ""
            total15Label.text = ""
            tipCustomLabel.text = ""
            totalCustomLabel.text = ""
        }
    }
}

func formatAsCurrency(number : NSNumber) -> String {
    return NSNumberFormatter.localizedStringFromNumber(number, numberStyle: NSNumberFormatterStyle.CurrencyStyle)
}

func +(left: NSDecimalNumber, right: NSDecimalNumber) -> NSDecimalNumber {
    return left.decimalNumberByAdding(right)
}

func *(left: NSDecimalNumber, right: NSDecimalNumber) -> NSDecimalNumber {
    return left.decimalNumberByMultiplyingBy(right)
}

func /(left: NSDecimalNumber, right: NSDecimalNumber) -> NSDecimalNumber {
    return left.decimalNumberByDividingBy(right)
}
