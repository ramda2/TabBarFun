//
//  ToggleModel.swift
//  Demo2Toggle
//
//  Created by David Gerstl on 9/6/16.
//  Copyright © 2016 Farmingdale State College. All rights reserved.
//

import Foundation

class ToggleModel {
    var messages = ["You are a C++ programmer",
                    "your skateboard has three wheels"]

    // need the type because we don't initialize it on this line
    var nextMessageCounter: Int
    
    // the initializer (Swift "ctor" equivalent)
    init() {
        nextMessageCounter = 0
    }
    
    // assumes we have at least one element
    func getNextMessage()->String {
        // just to be safe in case we've removed an element
        if nextMessageCounter>=messages.count {
            nextMessageCounter = 0
        }
        let nmc = nextMessageCounter
        // move through array, return to zero when you hit the end
        nextMessageCounter = (nextMessageCounter+1)%messages.count
        return messages[nmc]
    }
    
    func addMessage(theMessage: String) {
        if theMessage != "" {
            messages.append(theMessage)
        }
    }
    
    func isMessagePresent(msg: String)->Bool {
        // _ is an anonymous variable
        // return true if not nil
        /*
        if let _ = messages.indexOf(msg) {
            return true
        }
        return false
 */
        return nil != messages.indexOf(msg)
    }
    
    func removeMessage(theMessage: String) {
        if let index = messages.indexOf(theMessage) {
            messages.removeAtIndex(index)
        }
        // if we've deleted the last message, add something
        if messages.count == 0 {
            addMessage("You're that special kind of idiot who deletes all the messages")
        }
    }

    
}






























