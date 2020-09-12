//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Anqi Fu on 9/11/20.
//  Copyright © 2020 AngelFu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var amountBeforeTaxTextField: UITextField!
    @IBOutlet weak var tipPercentageLabel: UILabel!
    @IBOutlet weak var tipPercentageSlider: UISlider!
    @IBOutlet weak var numberOfPeopleSlider: UISlider!
    @IBOutlet weak var numberofPeopleLabel: UILabel!
    @IBOutlet weak var eachPersonAmountLabel: UILabel!
     
    @IBOutlet weak var totalResultLabel: UILabel!
    
    var tipCalculator = TipCalculator(amountBeforeTax: 0, tipPercentage: 10)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        amountBeforeTaxTextField.becomeFirstResponder()
    }
    
    func calculateBill(){
        tipCalculator.tipPercentage = Double(tipPercentageSlider.value) / 100.0
        tipCalculator.amountBeforeTax = (amountBeforeTaxTextField.text! as NSString).doubleValue
        tipCalculator.calculateTip()
        updateUI()
    }
    func updateUI(){
        totalResultLabel.text = String(format: "$%0.2f", tipCalculator.totalAmount)
        let numberOfPeople: Int = Int(numberOfPeopleSlider.value)
        eachPersonAmountLabel.text = String(format: "$%0.2f", tipCalculator.totalAmount / Double(numberOfPeople))
    }
    
    
    
    @IBAction func tipSliderValueChanged(sender:Any){
        tipPercentageLabel.text = String(format:"Tip:%02d%%", Int(tipPercentageSlider.value))
        calculateBill()
        
    }
    @IBAction func numberOfPeopleSliderValueChanged(sender:Any){
        numberofPeopleLabel.text = "Split: \(Int(numberOfPeopleSlider.value))"
        calculateBill()
        
    }
    
    @IBAction func amountBeforeTaxTextFieldChanged(sender:Any){
        calculateBill()
    }

}

