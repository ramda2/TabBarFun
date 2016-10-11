//
//  CalculatorViewController.swift
//  Calculon
//
//  Created by David Gerstl on 9/15/16.
//  Copyright © 2016 Farmingdale State College. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController, UITabBarControllerDelegate {

    @IBOutlet weak var calculatorDisplay: UILabel!
    var myModel = CalculatorModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        calculatorDisplay.text = myModel.getDisplay()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Button Press Methods
    @IBAction func decimalPointPressed() {
        print("decimal pressed")
        myModel.decimalPressed()
        calculatorDisplay.text = myModel.getDisplay()
    }
    @IBAction func clearPressed() {
        print("clear pressed")
        myModel.clear()
        calculatorDisplay.text = myModel.getDisplay()
    }

    @IBAction func operationPressed(sender: UIButton) {
        // Let's play with force unwrapped optionals
        // as the label better be set
        let labelText:String! = sender.currentTitle
        print("The current title is \(labelText)")
        switch labelText {
        case "+":
            myModel.operationPressed(.Plus)
        case "-":
            myModel.operationPressed(.Minus)
        case "=":
            myModel.operationPressed(.Equals)
        case "x":
            myModel.operationPressed(.Multiply)
        case "/":
            myModel.operationPressed(.Divide)
        default:
            calculatorDisplay.text = myModel.getDisplay()
        }
        calculatorDisplay.text = myModel.getDisplay()
    }
    
    @IBAction func numberPressed(sender: AnyObject) {
        if let theButton = sender as? UIButton {
            // these buttons all have labels, so
            // we force unwrap
            let labelText = theButton.currentTitle!
            print("The current title is \(labelText)")
            let labelInt = Int(labelText)!
            myModel.numberPressed(labelInt)
            calculatorDisplay.text = myModel.getDisplay()
        }
        
    }
    
    //MARK: - Methods for the Tab Bar
    func shouldISwitch() ->Bool {
        print("The system is asking whether I should switch")
        return myModel.shouldISwitchViews()
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














