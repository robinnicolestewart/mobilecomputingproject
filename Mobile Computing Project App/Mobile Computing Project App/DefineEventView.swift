//
//  DefineEventView.swift
//  Mobile Computing Project App
//
//  Created by Diego Wright on 3/20/17.
//  Copyright © 2017 Robin Stewart. All rights reserved.
//

import UIKit

class DefineEventView: UIViewController {
    
    var alertController:UIAlertController? = nil
    
    @IBOutlet weak var eventName: UITextField!  // This will be the name of the medical event
    var attributeList:[AnyObject] = []          // This will contain attributes added, starts with none when defining new event
    
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var attributeTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Define Event"
        
        let save = UIBarButtonItem(title: "Save", style: UIBarButtonItemStyle.done, target: self, action: #selector(DefineEventView.saveEvent))
        //save.title = "Save"
        //save.action = #selector(DefineEventView.saveEvent)
        self.navigationItem.rightBarButtonItem = save
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addAttributeSegue" {
            let backItem = UIBarButtonItem()
            backItem.title = "Cancel"
            navigationItem.backBarButtonItem = backItem
        }
    }
    
    func saveEvent() {
        // Check to see if there are any attributes or if an event name is entered
        if self.eventName.text == "" {
            self.alertController = UIAlertController(title: "Hey!", message: "You must have a name for your medical event",
                                                     preferredStyle: UIAlertControllerStyle.alert)
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
                (action:UIAlertAction) in print("Ok pressed");
            }
            self.alertController!.addAction(OKAction)
            self.present(self.alertController!, animated: true, completion:nil)
            return
        } else if self.attributeList.count == 0 {
            self.alertController = UIAlertController(title: "Listen!", message: "You must have at least one attribute for your event",
                                                     preferredStyle: UIAlertControllerStyle.alert)
            let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
                (action:UIAlertAction) in print("Ok pressed");
            }
            self.alertController!.addAction(OKAction)
            self.present(self.alertController!, animated: true, completion:nil)
            return
        }
        
        print("Event type Saved!")
        // Return to previous view which is Medical Event Table
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
}
