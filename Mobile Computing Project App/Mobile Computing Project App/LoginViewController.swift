//
//  LoginViewController.swift
//  Project - William
//
//  Created by Zhenyu Zhang on 3/24/17.
//  Copyright © 2017 CS 329E. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var passWord: UITextField!
    @IBOutlet weak var checkLogin: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
    }
    /*
    @IBAction func loginAction(_ sender: Any) {
        if userName?.text == "CS329E" && passWord?.text == "123456"{
            checkLogin.text = "Sucess"
        }else{
            checkLogin.text = "Fail"
        }
    }
   */
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "LoginSeg"{
            if userName?.text == "CS329E" && passWord?.text == "123456"{
                checkLogin.text = "Sucess"
                return true
            }else{
                checkLogin.text = "Fail"
                return false
            }
        }
        return true
    }
    
    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "LoginSeg" {
            if let destinationVC = segue.destination as? TabVC {
                if userName?.text == "CS329E" && passWord?.text == "123456"{
                    return true
                }
                
            }
        }
    }
    */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
