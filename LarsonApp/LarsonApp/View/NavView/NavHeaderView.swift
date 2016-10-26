//
//  NavHeaderView.swift
//  balabala
//
//  Created by appledev110 on 3/8/16.
//  Copyright © 2016 appledev110. All rights reserved.
//

import UIKit

class NavHeaderView: UIView {
    var opertionBtnHandler : ButtonTouchUpBlock?
    var testBtnHandler : ButtonTouchUpBlock?
    
   
    @IBOutlet weak var optionBtn: MKButton!
//    override func awakeFromNib() {
//        navTitleLbl.adjustsFontSizeToFitWidth = true
//        navTitleLbl.minimumScaleFactor = 0.8
//
//    }
//
    @IBAction func testBtnTap(sender: AnyObject) {
        if testBtnHandler != nil {
            testBtnHandler!()
        }
    }
    @IBOutlet weak var navTitleLbl: UILabel!
    
    func initUI(str : String, bolBack : Bool){
        navTitleLbl.text = str
        if bolBack == true {
            optionBtn.setImage(UIImage(named: "closeW"), for: UIControlState.normal)
        } else {
            optionBtn.imageView?.image = UIImage(named: "Menu")
        }
    }
    @IBAction func operationBtn(_ sender: AnyObject) {
        if opertionBtnHandler != nil {
            opertionBtnHandler!()
        }
    }

}
