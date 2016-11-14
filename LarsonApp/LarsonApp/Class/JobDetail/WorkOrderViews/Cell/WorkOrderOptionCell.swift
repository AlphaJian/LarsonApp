//
//  WorkOrderOptionCell.swift
//  LarsonApp
//
//  Created by Perry Z Chen on 11/11/16.
//  Copyright © 2016 Jian Zhang. All rights reserved.
//

import UIKit

class WorkOrderOptionCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        let viewOption = SelectionView(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
        viewOption.initUI(title: "Are you sure?", strY: "OK", strNo: "Cancel")
        viewOption.titleLbl.textColor = .darkGray
        self.containerView.addSubview(viewOption)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
