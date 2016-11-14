//
//  AddPartsCell.swift
//  LarsonApp
//
//  Created by Perry Z Chen on 11/11/16.
//  Copyright © 2016 Jian Zhang. All rights reserved.
//

import UIKit

class AddPartsCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func initUI(parameter: (String)) {
        self.titleLabel.text = parameter
    }
    
}
