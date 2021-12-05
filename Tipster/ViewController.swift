//
//  ViewController.swift
//  Tipster
//
//  Created by admin on 04/12/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var enteredNumber: UILabel!
    
    @IBOutlet weak var lowerPercent: UILabel!
    @IBOutlet weak var lowerTip: UILabel!
    @IBOutlet weak var lowerTotal: UILabel!
    
    @IBOutlet weak var middlePercent: UILabel!
    @IBOutlet weak var middleTip: UILabel!
    @IBOutlet weak var middleTotal: UILabel!
    
    @IBOutlet weak var highPercent: UILabel!
    @IBOutlet weak var highTip: UILabel!
    @IBOutlet weak var highTotal: UILabel!
    
    @IBOutlet weak var decimal: UIButton!
    
    @IBOutlet weak var groupSizeLabel: UILabel!
    
    var number = 0.0
    
    var groupSize = 1
    
    var lowerPercentNumber = 15
    var lowerTipNumber = 0.0
    
    var middlePercentNumber = 20
    var middleTipNumber = 0.0
    
    var highPercentNumber = 25
    var highTipNumber = 0.0
    
    var inDecimalFunc = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func numberButton(_ sender: UIButton) {
        inDecimalFunc = false
        if enteredNumber.text == "0"{
            enteredNumber.text = "\(sender.titleLabel?.text ?? "")"
        }
        else{
            enteredNumber.text = "\(enteredNumber.text ?? "")\(sender.titleLabel?.text ?? "")"
        }
        number = Double(enteredNumber.text ?? "") ?? -1
        if number == -1{
            enteredNumber.text = "ERROR"
            return
        }
        updateData()
    }
    
    @IBAction func tipsSlider(_ sender: UISlider) {
        if inDecimalFunc{
            return
        }
        else{
            lowerPercentNumber = Int(sender.value*100) + 5
            lowerPercent.text = "\(lowerPercentNumber)%"
            
            middlePercentNumber = Int(sender.value*100) + 10
            middlePercent.text = "\(middlePercentNumber)%"
            
            highPercentNumber = Int(sender.value*100) + 15
            highPercent.text = "\(highPercentNumber)%"
            
            updateData()
        }
    }
    
    @IBAction func groupSlider(_ sender: UISlider) {
        if inDecimalFunc{
            return
        }
        else{
            groupSize = Int(sender.value*10)
            groupSizeLabel.text = "Group Size: \(groupSize)"
            
            updateData()
        }
    }
    
    @IBAction func resetButton(_ sender: Any) {
        enteredNumber.text = "0"
        number = 0
        
        lowerTipNumber = 0.0
        lowerTip.text = "0"
        lowerTotal.text = "0"
        
        middleTipNumber = 0.0
        middleTip.text = "0"
        middleTotal.text = "0"
        
        highTipNumber = 0.0
        highTip.text = "0"
        highTotal.text = "0"
       
        decimal.isEnabled = true
    }
    
    @IBAction func decimalButton(_ sender: UIButton) {
        inDecimalFunc = true
        enteredNumber.text = "\(enteredNumber.text ?? "")."
        sender.isEnabled = false
    }
    
    func updateData(){
        lowerTipNumber = (number * Double(lowerPercentNumber) / 100) / Double(groupSize)
        lowerTip.text = String(format: "%.2f",lowerTipNumber)
        lowerTotal.text = String(format: "%.2f", (lowerTipNumber + number))
        
        middleTipNumber = (number * Double(middlePercentNumber) / 100) / Double(groupSize)
        middleTip.text = String(format: "%.2f",middleTipNumber)
        middleTotal.text = String(format: "%.2f",(middleTipNumber + number))
        
        highTipNumber = (number * Double(highPercentNumber) / 100) / Double(groupSize)
        highTip.text = String(format: "%.2f",highTipNumber)
        highTotal.text = String(format: "%.2f",(highTipNumber + number))
    }
    
}

