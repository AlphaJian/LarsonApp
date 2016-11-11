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
        let usermodel = FileUtility.unarchive(fileName: kAccountFileName) as! UserModel
//        headshotImg.sd_setImage(with: usermodel.google_imageURL) { (img, err, SDImageCacheType, url) in
//            print(url)
//        }
        emailLbl.text = usermodel.google_email
        
        let img = UIImageView(frame: CGRect(x: 16, y: 40, width: 60, height: 60))
        img.backgroundColor = UIColor.red
        self.addSubview(img)
        
        img.clipsToBounds = true
        img.layer.cornerRadius = img.width() / 2
        img.sd_setImage(with: usermodel.google_imageURL)
    }
}
