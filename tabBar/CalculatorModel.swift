//
//  CalculatorModel.swift
//  Calculon
//
//  Created by David Gerstl on 9/15/16.
//  Copyright © 2016 Farmingdale State College. All rights reserved.
//

import Foundation

enum CalculatorOperation {
    case Plus
    case Minus
    case None
    case Equals
    case Multiply
    case Divide
    // this is set right after reset
    // so the next number resets the display
}

class CalculatorModel {
    // This should be internationalized for 
    // countries that use , as decimal separator
    var displayNumber = "0.0"
    var total = 0.0
    var operationInProgress:CalculatorOperation = .None
    // on next digit, start a new display number
    var replaceDisplayOnNextDigit = true
    var displayError = false
    //this is a toggle variable representing persmission to switch view controllers
    var toggleShouldSwitchViews = false
    
    //MARK: Methods
    func clear(){
        displayError = false
        displayNumber = "0.0"
        total = 0.0
        operationInProgress = .None
        replaceDisplayOnNextDigit = true

    }
    
    func getDisplay()->String {
        if displayError {
            return "ERROR"
        }
        else{
            return displayNumber
        }
    }
    // decimal point pressed
    func decimalPressed(){
        if replaceDisplayOnNextDigit {
            displayNumber = "0."
            operationInProgress = .None
        } else {
            if !displayNumber.containsString(".") {
                displayNumber += "."
            }
        }
        replaceDisplayOnNextDigit = false
    }
    func operationPressed(operation: CalculatorOperation){
        //toggle switch ability on tab view controller if use enters special keys "0.07" followed by an "="
        if operation == .Equals && displayNumber == "0.07" {
            toggleShouldSwitchViews = !toggleShouldSwitchViews
        }

        if !replaceDisplayOnNextDigit {
            let someNumber: Double! = Double(displayNumber)
            switch operationInProgress {
                case .Minus:
                    total = total - someNumber
                case .Plus:
                    total = total + someNumber
                case .None:
                    total = someNumber
                case .Multiply:
                    total = total * someNumber
                case .Divide:
                    if someNumber != 0 {
                        total = total / someNumber
                    }
                    else {
                        displayError = true
                    }
                default:
                    break
            }
        }
        displayNumber = "\(total)"
        operationInProgress = operation
        replaceDisplayOnNextDigit = true
    }
    
    func numberPressed(num: Int){
        if replaceDisplayOnNextDigit {
            // If we jusr did equals and now hit a #, reset the calculator: we're starting over
            if operationInProgress == .Equals {
                clear()
            }
            displayNumber = "\(num)"
        } else {
            displayNumber += "\(num)"
        }
        replaceDisplayOnNextDigit = false
    }
    
    func shouldISwitchViews() -> Bool {
        return toggleShouldSwitchViews
    }
    
    
//    //MARK: Depricated methods
//    func minus(subtractMe: Double) {
//        total -= subtractMe
//    }
//    
//    func plus(addMe: Double) {
//        total += addMe
//    }
    
    
    
    
    
}