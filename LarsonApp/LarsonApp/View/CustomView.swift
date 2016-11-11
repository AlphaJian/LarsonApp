//
//  CustomView.swift
//  LarsonApp
//
//  Created by Jian Zhang on 11/11/16.
//  Copyright © 2016 Jian Zhang. All rights reserved.
//

import UIKit

class CustomView: UIView {

    override func awakeFromNib() {
        self.layer.shadowOpacity = 0.5
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowRadius = 3
        self.layer.shadowOffset = CGSize(width: 1, height: 1)
    }

}
