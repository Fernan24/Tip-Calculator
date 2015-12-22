//
//  SettingsViewController.swift
//  TipCalc
//
//  Created by Fernando Rodríguez on 12/11/15.
//  Copyright © 2015 Fernando Rodríguez. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var saveLabel: UILabel!
    @IBOutlet weak var actIndicator: UIActivityIndicatorView!
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var firstPercentStepper: UIStepper!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var secondPercentStepper: UIStepper!
    @IBOutlet weak var thirdLabel: UILabel!
    @IBOutlet weak var thirdPercentStepper: UIStepper!
    let updatedPercent = NSUserDefaults.standardUserDefaults()
    var tipPercentages = [Int]()
  
    @IBAction func fistStepper(sender: UIStepper) {
        let first = firstPercentStepper.value
        
        
        firstLabel.text = "\(Int(first))%"
    }

    @IBAction func secondStepper(sender: UIStepper) {
        let second = secondPercentStepper.value
        secondLabel.text = "\(Int(second))%"
    }
 
    @IBAction func thirdStepper(sender: UIStepper) {
        let third = thirdPercentStepper.value
        thirdLabel.text = "\(Int(third))%"
    }
    @IBAction func save(sender: AnyObject) {
        
        actIndicator.startAnimating()
        saveLabel.text = "Saving"
        let newtips = [Int(firstPercentStepper.value), Int(secondPercentStepper.value),
        Int(thirdPercentStepper.value)]
        let def = NSUserDefaults.standardUserDefaults()
        def.setObject(newtips, forKey: "tips")
        def.synchronize()
        
        let delay = 1.0 * Double(NSEC_PER_SEC)
        let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
        dispatch_after(time, dispatch_get_main_queue()) {
            self.saveLabel.text = "Saved"
            self.actIndicator.stopAnimating()
        }
        
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tipPercentages = updatedPercent.arrayForKey("tips")! as! [Int]
        
        firstPercentStepper.minimumValue = 1
        firstPercentStepper.maximumValue = 100
        firstPercentStepper.stepValue = 1
        firstPercentStepper.autorepeat = true
        
        secondPercentStepper.minimumValue = 1
        secondPercentStepper.maximumValue = 100
        secondPercentStepper.stepValue = 1
        secondPercentStepper.autorepeat = true
        
        thirdPercentStepper.minimumValue = 1
        thirdPercentStepper.maximumValue = 100
        thirdPercentStepper.stepValue = 1
        thirdPercentStepper.autorepeat = true
        
        firstPercentStepper.value = Double(tipPercentages[0])
        secondPercentStepper.value = Double(tipPercentages[1])
        thirdPercentStepper.value = Double(tipPercentages[2])
        firstLabel.text = "\(tipPercentages[0])%"
        secondLabel.text = "\(tipPercentages[1])%"
        thirdLabel.text = "\(tipPercentages[2])%"
        saveLabel.text = ""
        


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
