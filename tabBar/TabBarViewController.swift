//
//  TabBarViewController.swift
//  tabBar
//
//  Created by ANGELIE RAMDIAL on 10/11/16.
//  Copyright © 2016 ANGELIE RAMDIAL. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //TO DO:Set a delegate
        delegate = self
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func tabBarController(tabBarController: UITabBarController, shouldSelectViewController viewController: UIViewController) -> Bool {
        print("The system is asking whether I should switch")
        
        //create a variable with is going to point to the child view controller in the [0] position
        
        if let myCalcViewController = childViewControllers[0] as? CalculatorViewController {
            return myCalcViewController.shouldISwitch()
        }
         return true        
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
