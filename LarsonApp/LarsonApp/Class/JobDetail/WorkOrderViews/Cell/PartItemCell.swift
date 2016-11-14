//
//  PartItemCell.swift
//  LarsonApp
//
//  Created by Perry Z Chen on 11/11/16.
//  Copyright © 2016 Jian Zhang. All rights reserved.
//

import UIKit

class PartItemCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    
    var removeItemBlock: ReturnBlock?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func removeItemAction(_ sender: UIButton) {
        if self.removeItemBlock != nil {
            self.removeItemBlock?("" as AnyObject)
        }
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
