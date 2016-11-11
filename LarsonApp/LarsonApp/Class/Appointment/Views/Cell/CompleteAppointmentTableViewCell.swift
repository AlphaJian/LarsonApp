//
//  CompleteAppointmentTableViewCell.swift
//  LarsonApp
//
//  Created by Perry Z Chen on 11/7/16.
//  Copyright © 2016 Jian Zhang. All rights reserved.
//

import UIKit

class CompleteAppointmentTableViewCell: UITableViewCell {

    @IBOutlet weak var placeholderLabel: UILabel!
    @IBOutlet weak var legacyIdLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.containerView.layer.cornerRadius = 4.0
        self.containerView.layer.shadowColor = UIColor.gray.cgColor
        self.containerView.layer.shadowOffset = CGSize(width: 3, height: 3)
        self.containerView.layer.shadowOpacity = 1;
        self.containerView.layer.shadowRadius = 2.0;
        // Initialization code
    }
    
    func setupCellData(model: AppointmentModel) {
        self.placeholderLabel.text = model.jobType
        self.legacyIdLabel.text = model.legacyId
        self.nameLabel.text = model.customerName
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
