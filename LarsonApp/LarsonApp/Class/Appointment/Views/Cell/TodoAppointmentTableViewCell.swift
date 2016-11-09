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
    @IBOutlet weak var trunkLabel: UILabel!
    
    private var phoneStr: String = ""
    private var legacyID: String = ""
    
    var phoneCallback: ReturnBlock?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.containerView.layer.cornerRadius = 4.0
        // Initialization code
    }

    func setupCellData(model: AppointmentModel) {
        self.placeholderLabel.text = model.jobType
        self.legacyIdLabel.text = model.legacyId
        self.nameLabel.text = model.customerName
        self.addressLabel.text = model.customerAddress
        self.trunkLabel.text = "\(model.partsReqInTruckNum!) of \(model.partsReqNum!) parts\n in Truck"
        self.phoneStr = model.telephoneNumber
        self.legacyID = model.legacyId
    }
    
    @IBAction func phoneAction(_ sender: UIButton) {
        print(self.legacyID)
        let phoneURL = NSURL(string: "telprompt://\(self.phoneStr)")
        let phoneCallbackURL = NSURL(string: "tel://\(self.phoneStr)")
        if UIApplication.shared.canOpenURL(phoneURL as! URL) {
            UIApplication.shared.openURL(phoneURL as! URL)
        } else if UIApplication.shared.canOpenURL(phoneCallbackURL as! URL) {
            UIApplication.shared.openURL(phoneCallbackURL as! URL)
        }
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
//        self.contentView.backgroundColor = UIColor.clear
        // Configure the view for the selected state
    }
    
}
