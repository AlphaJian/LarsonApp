//
//  JobPartsTableViewCell.swift
//  LarsonApp
//
//  Created by Jian Zhang on 11/8/16.
//  Copyright © 2016 Jian Zhang. All rights reserved.
//

import UIKit

class JobPartsTableViewCell: UITableViewCell {

    @IBOutlet weak var partNameLbl: UILabel!
    @IBOutlet weak var partInfoLbl: UILabel!
    @IBOutlet weak var partQualityLbl: UILabel!
    
    @IBOutlet weak var partNameLblHeight: NSLayoutConstraint!
    
    var partModel : PartModel?
    var indexPath : IndexPath?
    var deleteHandler : CellTouchUpBlock?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func initUI(model : PartModel, index : IndexPath){
        partModel = model
        indexPath = index
        
        let attrStr = NSMutableAttributedString(string: model.name)
        attrStr.addAttribute(NSFontAttributeName, value: UIFont.systemFont(ofSize: 13), range: NSMakeRange(0, model.name.characters.count))
        let height = StringUtil.getAttributeString(str: attrStr, width: LCDW - 115)
        partNameLblHeight.constant = height + 5
        self.layoutIfNeeded()
        partNameLbl.text = model.name
        partInfoLbl.text = "#\(model.vendorId)   $\(model.price)"
    }
    @IBAction func deleteTapped(_ sender: AnyObject) {
        if deleteHandler != nil
        {
            deleteHandler!(indexPath!, partModel!)
        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
