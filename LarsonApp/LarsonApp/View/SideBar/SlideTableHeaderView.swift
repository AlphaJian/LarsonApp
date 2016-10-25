//
//  SlideTableHeaderView.swift
//  JoeApp
//
//  Created by appledev018 on 3/24/16.
//  Copyright © 2016 PwC. All rights reserved.
//

import UIKit

class SlideTableHeaderView: UIView{

    @IBOutlet weak var headshotImg: UIImageView!
    @IBOutlet weak var emailLbl: UILabel!
    
    func initUI(){
        headshotImg.clipsToBounds = true
        headshotImg.layer.cornerRadius = headshotImg.width() / 2
//        headshotImg.sd_setImageWithURL(NSURL(string: UserModel.sharedModel.picture), placeholderImage: UIImage(named: "joe-malone"))
//        emailLbl.text = UserModel.sharedModel.email
    }
}
