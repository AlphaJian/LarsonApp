//
//  StaticWorkOrderCell.swift
//  LarsonApp
//
//  Created by Perry Z Chen on 11/10/16.
//  Copyright © 2016 Jian Zhang. All rights reserved.
//

import UIKit

class StaticWorkOrderCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func initUI(parameter: (String, String)) {
        self.titleLabel.text = parameter.0
        self.contentLabel.text = parameter.1
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
