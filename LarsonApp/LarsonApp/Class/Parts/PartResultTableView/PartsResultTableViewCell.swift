//
//  PartsResultTableViewCell.swift
//  LarsonApp
//
//  Created by Jian Zhang on 11/8/16.
//  Copyright © 2016 Jian Zhang. All rights reserved.
//

import UIKit

class PartsResultTableViewCell: UITableViewCell {

    @IBOutlet weak var partCountLbl: UILabel!
    @IBOutlet weak var partNameLbl: UILabel!
    @IBOutlet weak var partIdLbl: UILabel!
    @IBOutlet weak var partPriceLbl: UILabel!
    
    var model : PartModel?
    var indexPath : IndexPath?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func initUI(partmodel : PartModel, index : IndexPath){
        model = partmodel
        indexPath = index
        
        partNameLbl.text = partmodel.name
        partIdLbl.text = "#\(partmodel.number)"
        partPriceLbl.text = "$\(partmodel.price)"
        partCountLbl.text = "In Truck:0"
    }
    
    func clearCell(){
        partNameLbl.text = ""
        partIdLbl.text = ""
        partPriceLbl.text = ""
        partCountLbl.text = ""
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
