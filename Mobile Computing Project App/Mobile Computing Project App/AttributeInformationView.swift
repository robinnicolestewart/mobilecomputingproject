//
//  AttributeInformationView.swift
//  Mobile Computing Project App
//
//  Created by Diego Wright on 3/20/17.
//  Copyright © 2017 Robin Stewart. All rights reserved.
//

import UIKit

class AttributeInformationView: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    var alertController:UIAlertController? = nil
    
    fileprivate let attributeTypes:[String] = ["Text Field", "Slider", "Segmented Control", "Switch", "Stepper"]
    
    var currentAttibuteList:[(String, String)]?   // this will contain attributes defined for event and will be added to and passed back to event controller
    
    @IBOutlet weak var attributeName: UITextField!
    @IBOutlet weak var attributePicker: UIPickerView!

    //
    @IBAction func saveAttribute(_ sender: Any) {
        if self.attributeName.text == "" {
            self.alertController = UIAlertController(title: "Hey!", message: "You must have a name for your attribute",
                                                     preferredStyle: UIAlertControllerStyle.alert)
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
                (action:UIAlertAction) in print("Ok pressed");
            }
            self.alertController!.addAction(OKAction)
            self.present(self.alertController!, animated: true, completion:nil)
            return
        } else {
            let name = self.attributeName.text!.replacingOccurrences(of: " ", with: "_")
            let type = self.attributeTypes[self.attributePicker.selectedRow(inComponent: 0)].replacingOccurrences(of: " ", with: "_")
            let attribute = (name, type)
            print(attribute)
            
            // FIX THIS SHIT
            
            //self.currentAttibuteList!.append(attribute)
            
            //let n: Int! = self.navigationController?.viewControllers.count
            //let eventVC = self.navigationController?.viewControllers[n-1] as! DefineEventView
            //eventVC.attributeList = self.currentAttibuteList!
            
            _ = self.navigationController?.popViewController(animated: true)
        }
    }
    
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
    
    // This function adds some UI element that can take in data to view
    private func addElementToView(element: AnyObject) {
        
    }
 
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
            //let textField = UITextField()
        } else if row == 1 {
            self.view.backgroundColor = UIColor.red
            //let slider = UISlider()
        } else if row == 2 {
            self.view.backgroundColor =  UIColor.green
            //let segControl = UISegmentedControl()
        } else if row == 3 {
            self.view.backgroundColor = UIColor.blue
            //let switch = UISwitch()
        } else {
            self.view.backgroundColor = UIColor.purple
            //let stepper = UIStepper()
        }
    }

    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
}
