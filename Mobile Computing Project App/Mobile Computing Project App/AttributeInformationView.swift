//
//  AttributeInformationView.swift
//  Mobile Computing Project App
//
//  Created by Diego Wright on 3/20/17.
//  Copyright © 2017 Robin Stewart. All rights reserved.
//

import UIKit

class AttributeInformationView: UIViewController {

    fileprivate let attributeTypes:[String] = ["Pain Scale", "Pain Type", "Food Before", ]
    
    @IBOutlet weak var attributeName: UITextField!
    @IBOutlet weak var attributePicker: UIPickerView!
    
    //var attributeType:AnyObject
    //var values:AnyObject
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Create an Attribute"

        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
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

    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
}
