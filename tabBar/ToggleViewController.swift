//
//  ViewController.swift
//  Demo2Toggle
//
//  Created by David Gerstl on 9/6/16.
//  Copyright © 2016 Farmingdale State College. All rights reserved.
//

import UIKit

class ToggleViewController: UIViewController {

    var myModel = ToggleModel()

    @IBOutlet weak var theMessageLabel: UILabel!
    @IBOutlet weak var changeMessageTextField: UITextField!
    @IBOutlet weak var changeButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let theMessage = myModel.getNextMessage()
        print("The message is \(theMessage)")
        theMessageLabel.text = theMessage
        // put a placeholder in the text field
        changeMessageTextField.placeholder = "Enter Text Here"
        changeButton.setTitle("", forState: .Normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func nextMessageRequested(sender: AnyObject) {
        print("Button Pressed")
        theMessageLabel.text = myModel.getNextMessage()
    }
    
    @IBAction func changeMessage(sender: AnyObject) {
        // get the text in the text field
        let newMessage = changeMessageTextField.text
        // call the addMessage method on myModel
        if let realMessage = newMessage {
            if myModel.isMessagePresent(realMessage) {
                myModel.removeMessage(realMessage)
            } else {
                myModel.addMessage(realMessage)
            }
            // clear the text field
            changeMessageTextField.text = nil
            changeButton.setTitle("", forState: .Normal)
        }
    }
    
    
    @IBAction func inputFieldChanged(sender: AnyObject) {
        // get the text in the text field
        let newMessage = changeMessageTextField.text
        // call the addMessage method on myModel
        if let realMessage = newMessage {
            if myModel.isMessagePresent(realMessage){
                print("The message is present and is \(realMessage)")
                changeButton.setTitle("Delete", forState: .Normal)
            } else if realMessage != "" {
                print("The message is NOT present and is \(realMessage)")
                changeButton.setTitle("Add", forState: .Normal)
            } else {
                changeButton.setTitle("", forState: .Normal)
            }
        }
    }
    
    

}








