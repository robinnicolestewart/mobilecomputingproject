//
//  AlphaMainViewController.swift
//  Mobile Computing Project App
//
//  Created by Diego Wright on 3/20/17.
//  Copyright © 2017 Robin Stewart. All rights reserved.
//

import UIKit

class AlphaMainViewController: UIViewController {

    // Function that takes from Diego SB button to the my storyboard
    @IBAction func goToDiegoSB(_ sender: Any) {
        let storyboard = UIStoryboard(name: "MedicalEvent", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "MedEventNavController") as UIViewController
        self.present(controller, animated: true, completion: nil)
    }
    
    @IBAction func goToRobinSB(_ sender: Any) {
        print("This doesn't link anywhere yet")
        // let storyboard = UIStoryboard(name: "name_of_Robin_SB", bundle: nil)
        // let controller = storyboard.instantiateViewController(withIdentifier: "name_of_initial_VC") as UIViewController
        // self.present(controller, animated: true, completion: nil)
    }
    
    @IBAction func goToWilliamSB(_ sender: Any) {
        print("This doesn't link anywhere yet")
        // let storyboard = UIStoryboard(name: "name_of_William_SB", bundle: nil)
        // let controller = storyboard.instantiateViewController(withIdentifier: "name_of_initial_VC") as UIViewController
        // self.present(controller, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Alpha Main Page"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
