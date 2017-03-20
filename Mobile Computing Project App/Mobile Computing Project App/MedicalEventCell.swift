//
//  MedicalEventCell.swift
//  Mobile Computing Project App
//
//  Created by Diego Wright on 3/20/17.
//  Copyright © 2017 Robin Stewart. All rights reserved.
//

import UIKit

class MedicalEventCell: UITableViewCell {

    @IBOutlet weak var cellTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        print("cell created")
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
