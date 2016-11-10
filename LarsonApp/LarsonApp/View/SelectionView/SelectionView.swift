//
//  SelectionView.swift
//  LarsonApp
//
//  Created by Jian Zhang on 11/10/16.
//  Copyright © 2016 Jian Zhang. All rights reserved.
//

import UIKit

class SelectionView: UIView {

    func initUI(title : String, strY : String, strNo : String){
        let titleLbl = UILabel(frame: CGRect(x: 0, y: 0, width: self.width(), height: 20 ))
        titleLbl.font = UIFont.systemFont(ofSize: 13)
        titleLbl.text = title
        self.addSubview(titleLbl)
        
        let yesBtn = UIButton(type: .custom)
        yesBtn.frame = CGRect(x: 0, y: titleLbl.bottom() + 5, width: 20, height: 20)
        yesBtn.backgroundColor = UIColor.blue
        self.addSubview(yesBtn)
        
        let yesLbl = UILabel(frame: CGRect(x: yesBtn.right() + 10, y: titleLbl.bottom() + 5, width: 50, height: 20))
        yesLbl.text = strY
        titleLbl.font = UIFont.systemFont(ofSize: 13)
        self.addSubview(yesLbl)
        
        let noBtn = UIButton(type: .custom)
        noBtn.frame = CGRect(x: yesLbl.right() + 10, y: titleLbl.bottom() + 5, width: 20, height: 20)
        noBtn.backgroundColor = UIColor.blue
        self.addSubview(noBtn)
        
        let noLbl = UILabel(frame: CGRect(x: noBtn.right() + 10, y: titleLbl.bottom() + 5, width: self.width() - noBtn.right() - 10, height: 20))
        noLbl.text = strNo
        noLbl.font = UIFont.systemFont(ofSize: 13)
        self.addSubview(noLbl)
    }
}
