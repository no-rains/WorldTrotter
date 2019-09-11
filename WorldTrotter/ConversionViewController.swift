//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by norains on 2019/9/3.
//  Copyright © 2019 norains. All rights reserved.
//

import UIKit

class ConversionViewController:UIViewController,UITextFieldDelegate
{
    @IBOutlet var celsiusLabel: UILabel!
    @IBOutlet var textField: UITextField!
    var fahrenheitValue: Measurement<UnitTemperature>?
    {
        didSet
        {
            updateCelsiusLabel()
        }
    }
    
    let numberFormatter:NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
        
    }()
    
    var celsiusValue: Measurement<UnitTemperature>?
    {
        if let fahrenheitValue = fahrenheitValue
        {
            return fahrenheitValue.converted(to: .celsius)
        }
        else
        {
            return nil
        }
    }
    
    
    
    @IBAction func fahrenHeitFieldEditingChanged(_ textField: UITextField)
    {
        if let text = textField.text, let number = numberFormatter.number(from:text)
        {
            //fahrenheitValue = Measurement(value: number.doubleValue, unit: .fahrenheit)
            fahrenheitValue = Measurement(value: number.doubleValue, unit: .fahrenheit)
        }
        else
        {
            fahrenheitValue = nil
        }
    }
    
    @IBAction func dismissKeyBoard(_ sender:UITapGestureRecognizer)
    {
        textField.resignFirstResponder()
    }
    
    func updateCelsiusLabel()
    {
        if let celsiusValue = celsiusValue
        {
            celsiusLabel.text = "\(celsiusValue.value)"
            celsiusLabel.text = numberFormatter.string(from: NSNumber(value:celsiusValue.value))
        }
        else
        {
            celsiusLabel.text = "???"
        }
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        updateCelsiusLabel()
        print("test")
    }
    
    
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String)-> Bool
 
    {
        let currentLocal = Locale.current
        let decimalSeparator = currentLocal.decimalSeparator ?? "."
        
        let existingTextHasDecimalSeparator = textField.text?.range(of:decimalSeparator)
        let replacementTextHasDecimalSeparator = string.range(of: decimalSeparator)
        
        if existingTextHasDecimalSeparator != nil,
            replacementTextHasDecimalSeparator != nil
        {
            return false
        }
        else
        {
            return true
        }
        
    }
    
    
}
