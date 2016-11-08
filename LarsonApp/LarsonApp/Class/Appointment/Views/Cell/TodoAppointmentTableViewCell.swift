//
//  TodoAppointmentTableViewCell.swift
//  LarsonApp
//
//  Created by Perry Z Chen on 11/7/16.
//  Copyright © 2016 Jian Zhang. All rights reserved.
//

import UIKit

class TodoAppointmentTableViewCell: UITableViewCell {

    @IBOutlet weak var placeholderLabel: UILabel!
    @IBOutlet weak var legacyIdLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.containerView.layer.cornerRadius = 4.0
        self.containerView.layer.shouldRasterize = true
        // Initialization code
    }

    func setupCellData(model: AppointmentModel) {
        self.placeholderLabel.text = model.jobType
        self.legacyIdLabel.text = model.legacyId
        self.nameLabel.text = model.customerName
        self.addressLabel.text = model.customerAddress
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
//        self.contentView.backgroundColor = UIColor.clear
        // Configure the view for the selected state
    }
    
}
