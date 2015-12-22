//
//  ViewController.swift
//  TipCalc
//
//  Created by Fernando Rodríguez on 12/11/15.
//  Copyright © 2015 Fernando Rodríguez. All rights reserved.
//

import UIKit

class ViewController: UIViewController  {
    

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    var tip:Double = 0
    var total:Double = 0
    var tipPercentages = [15, 18, 20]
    let updatedPercent = NSUserDefaults.standardUserDefaults()
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if !isAppAlreadyLaunchedOnce(){
            updatedPercent.setObject(tipPercentages, forKey: "tips")
            
        }
        
        totalLabel.text = getCurrency(total)
        tipLabel.text = getCurrency(tip)
        billField.becomeFirstResponder()
        
        tipPercentages = updatedPercent.arrayForKey("tips")! as! [Int]
        let seg = stringArr(tipPercentages)
        tipControl.removeAllSegments()
        for index in 0...2 {
            tipControl.insertSegmentWithTitle(seg[index], atIndex:index , animated: false)
            
        }
        tipControl.selectedSegmentIndex=0
        
        onEditingChanged(true)
        self.title = "Tip Calculator"
        
        
    }
    override func viewWillAppear(animated: Bool) {
        
        tipPercentages = updatedPercent.arrayForKey("tips")! as! [Int]
        let seg = stringArr(tipPercentages)
        tipControl.removeAllSegments()
        for index in 0...2 {
            tipControl.insertSegmentWithTitle(seg[index], atIndex:index , animated: false)
            
        }
        tipControl.selectedSegmentIndex=0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        let percentage = Double(tipPercentages[tipControl.selectedSegmentIndex])
        
        let billAmount = NSString(string: billField.text!).doubleValue
        let tip = billAmount*(percentage/100)
        let total = billAmount + tip
        
        tipLabel.text = getCurrency(tip)
        totalLabel.text = getCurrency(total)
        
    }

    @IBAction func onTap(sender: AnyObject) {

        view.endEditing(true)
        
    }
    
    func getCurrency(amount:Double)-> String {
        
        let formatter = NSNumberFormatter()
        formatter.numberStyle = .CurrencyStyle
        formatter.locale = NSLocale.currentLocale()
        return formatter.stringFromNumber(amount)!
        
    }
    func stringArr(arr:[Int]) -> [String]{
        
        var str = [String]()
        for value in arr {
            let temp = String(value)+"%"
            str.append(temp)
            
        }
        return str
    }
    func isAppAlreadyLaunchedOnce()->Bool{
        let defaults = NSUserDefaults.standardUserDefaults()
        
        if let isAppAlreadyLaunchedOnce = defaults.stringForKey("isAppAlreadyLaunchedOnce"){
            
            return true
        }else{
            defaults.setBool(true, forKey: "isAppAlreadyLaunchedOnce")
            
            return false
        }
    }
   
}

