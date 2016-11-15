//
//  SlideTableViewCell.swift
//  JoeApp
//
//  Created by appledev018 on 3/24/16.
//  Copyright © 2016 PwC. All rights reserved.
//

import UIKit

class SlideTableViewCell: UITableViewCell {
    @IBOutlet weak var cellLabel: UILabel!

    @IBOutlet weak var cellImage: UIImageView!
    
    func initUI(items: NSMutableDictionary, index: Int){
        cellLabel.text = items.value(forKey: "\(index)") as? String
       cellLabel.textColor = UIColor.black
        
        if index == items.value(forKey: "didSelect") as! Int {
            cellLabel.textColor = StringUtil.getColorWithRGB(red: 33, green: 105, blue: 243)

            cellImage.image = UIImage(named: items.value(forKey: "\(index)") as! String + "_Blue")
        } else {
            cellImage.image = UIImage(named: items.value(forKey: "\(index)") as! String)
        }
        
        
    }

}
