//
//  TextTitleView.swift
//  LarsonApp
//
//  Created by appledev018 on 11/7/16.
//  Copyright © 2016 Jian Zhang. All rights reserved.
//

import Foundation
import UIKit


class TextTitleView: UIView {
    
    func initUI( title: String, text: String) {
        layoutIfNeeded()
        
        
        
        let titleLable = UILabel(frame: CGRect(x: 0, y: frame.height/2, width: self.frame.width, height: self.frame.height/2))
        
        titleLable.text = title
        
        titleLable.font = UIFont.systemFont(ofSize: 13)
        
        titleLable.textColor = UIColor.gray
        
        self.addSubview(titleLable)
        
        
        let textLable = UILabel(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height/2))
        textLable.text = text
        
        textLable.font = UIFont.systemFont(ofSize: 13)
        
        self.addSubview(textLable)
        
    }
    
    
}
