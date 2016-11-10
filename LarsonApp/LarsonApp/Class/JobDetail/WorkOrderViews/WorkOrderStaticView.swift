//
//  WorkOrderStaticView.swift
//  LarsonApp
//
//  Created by Perry Z Chen on 11/10/16.
//  Copyright © 2016 Jian Zhang. All rights reserved.
//

import UIKit

class WorkOrderStaticView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    
    func initUI(parameter: (String, String)) {
        self.titleLabel.text = parameter.0
        self.contentLabel.text = parameter.1
    }
}
