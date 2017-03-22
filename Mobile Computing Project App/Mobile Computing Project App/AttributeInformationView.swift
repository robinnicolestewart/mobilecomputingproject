//
//  AttributeInformationView.swift
//  Mobile Computing Project App
//
//  Created by Diego Wright on 3/20/17.
//  Copyright © 2017 Robin Stewart. All rights reserved.
//

import UIKit

class AttributeInformationView: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    fileprivate let attributeTypes:[String] = ["Text Field", "Slider", "Segmented Control", "Switch", "Stepper"]
    
    @IBOutlet weak var attributeName: UITextField!
    @IBOutlet weak var attributePicker: UIPickerView!
    
    //var attributeType:AnyObject
    //var values:AnyObject
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Create an Attribute"
        
        // Setup picker attribute values
        self.attributePicker.dataSource = self
        self.attributePicker.delegate = self
        
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
    
    // Functions to satisfy UIPickerView delegate protocol ////////////////////////////////////////////////////
    func numberOfComponents(in: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.attributeTypes.count;
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.attributeTypes[row]
    }
    ///////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    // function that is called when a row is selected
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        if row == 0 {
            // let attLabel = UILabel(frame: CGRect(x: , y: 30, width: , height: <#T##Int#>)
            self.view.backgroundColor = UIColor.white
        } else if row == 1 {
            self.view.backgroundColor = UIColor.red
        } else if row == 2 {
            self.view.backgroundColor =  UIColor.green
        } else if row == 3 {
            self.view.backgroundColor = UIColor.blue
        } else {
            self.view.backgroundColor = UIColor.purple
        }
    }

    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
}
