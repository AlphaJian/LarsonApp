//
//  AddressView.swift
//  LarsonApp
//
//  Created by appledev018 on 11/7/16.
//  Copyright © 2016 Jian Zhang. All rights reserved.
//

import Foundation
import UIKit

class JobDetailView: UIView {
    
    
    @IBOutlet weak var addressView: UIView!
    
    @IBOutlet weak var mapView: UIView!
    @IBOutlet weak var customerLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    @IBOutlet weak var descriptionTitle: UILabel!
    @IBOutlet weak var descriptionText: UILabel!
    
    @IBOutlet weak var contactPerson: TextTitleView!
    @IBOutlet weak var sitePhone: TextTitleView!
    
    
    @IBOutlet weak var appointmentStatus: TextTitleView!
    
    @IBOutlet weak var division: TextTitleView!
    
    @IBOutlet weak var callStatus: TextTitleView!
    
    @IBOutlet weak var typeOfCall: TextTitleView!
    
    @IBOutlet weak var po: TextTitleView!
    
    
    @IBOutlet weak var descriptionHeight: NSLayoutConstraint!
    
    @IBOutlet weak var middleViewHeight: NSLayoutConstraint!
    
    
    @IBOutlet weak var callBtn: MKButton!
    
    
    let mapViewHeight: CGFloat = 100
    let addressViewHeight: CGFloat = 100
    
    func initUI(model: AppointmentModel){
        
        customerLabel.text = model.customerName
        addressLabel.text = model.customerAddress
        
        callBtn.setTitle("CALL DISPATCH", for: .normal)
        callBtn.setTitleColor(UIColor.black, for: .normal)
        callBtn.cornerRadius = 3
        callBtn.layer.shadowOpacity = 0.8
        callBtn.layer.shadowRadius = 5
        callBtn.layer.shadowOffset = CGSize(width: 3, height: 3)
        callBtn.layer.shadowColor = UIColor.gray.cgColor
        
        descriptionTitle.text = "Service Description"
        descriptionText.text = (model.jobDetail as NSString).uppercased
        
        let str = NSMutableAttributedString(string: (model.jobDetail as NSString).uppercased)
        
        str.addAttribute(NSFontAttributeName, value:UIFont.systemFont(ofSize: 15.0), range:NSRange(location:0,length: (model.jobDetail as NSString).uppercased.characters.count ))
        
        descriptionHeight.constant = StringUtil.getAttributeString(str: str, width: 335)
        
        middleViewHeight.constant =  descriptionHeight.constant + 280
        
        
        contactPerson.initUI(title: "Contact Person", text: "\(model.contactName!)")
        sitePhone.initUI(title: "Site Phone", text: "\(model.contactNumber!)")
        
        appointmentStatus.initUI(title: "Appointment Status", text: "\(model.currentStatus!)")
        division.initUI(title: "Division", text: "\(model.division!)")
        
        callStatus.initUI(title: "Call Status", text: "\(model.callStatus!)")
        
        typeOfCall.initUI(title: "Type of Call", text: "\(model.jobType!)")
        
        po.initUI(title: "PO#", text: "\(model.purchaseOrder!)")
        
        
    }
    
    
}
