//
//  SlideTableHeaderView.swift
//  JoeApp
//
//  Created by appledev018 on 3/24/16.
//  Copyright © 2016 PwC. All rights reserved.
//

import UIKit
import SDWebImage

class SlideTableHeaderView: UIView{

//    @IBOutlet weak var headshotImg: UIImageView!
    @IBOutlet weak var emailLbl: UILabel!
    
    func initUI(){
        emailLbl.text = UserManager.shareManager.userModel?.google_email
        
        let img = UIImageView(frame: CGRect(x: 16, y: 40, width: 60, height: 60))
        self.addSubview(img)
        
        img.clipsToBounds = true
        img.layer.cornerRadius = img.width() / 2
        img.sd_setImage(with: UserManager.shareManager.userModel?.google_imageURL)
    }
}
