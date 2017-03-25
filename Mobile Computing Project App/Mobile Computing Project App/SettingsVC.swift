//
//  SettingsVC.swift
//  Mobile Computing Project App
//
//  Created by Zhenyu Zhang on 3/24/17.
//  Copyright © 2017 Robin Stewart. All rights reserved.
//

import UIKit

class SettingsVC: UIViewController {
    var currentAction = 0
    @IBOutlet weak var segCtrl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Settings"
    }
    
    @IBAction func segAction(_ sender: Any) {
        currentAction = self.segCtrl.selectedSegmentIndex
    }
    
    @IBAction func saveBtn(_ sender: Any) {
        if currentAction == 0{
            Style.whiteTheme()
            //Style.setColor("white")
            
        }else if currentAction == 1{
            Style.orangeTheme()
            //Style.setColor("orange")
 
        }else{
            Style.blueTheme()
            //Style.setColor("blue")

        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
