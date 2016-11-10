//
//  WorkOrderScrollView.swift
//  LarsonApp
//
//  Created by Perry Z Chen on 11/10/16.
//  Copyright © 2016 Jian Zhang. All rights reserved.
//

import UIKit

class WorkOrderScrollView: UIScrollView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    @IBOutlet weak var callNumberContainer: UIView!
    
    @IBOutlet weak var stationNumberContainer: UIView!
    
    @IBOutlet weak var siteAddressContainer: UIView!
    
    @IBOutlet weak var zipCodeContainer: UIView!
    
    @IBOutlet weak var phoneNumberContainer: UIView!
    
    @IBOutlet weak var TechNumberContainer: UIView!
    
    
    
    func initUI(model: AppointmentModel) {
        var height : CGFloat = 0
        let callNumberView = Bundle.main.loadNibNamed("WorkOrderStaticView", owner: self, options: nil)?[0] as? WorkOrderStaticView
        callNumberView?.initUI(parameter: ("Call Number", model.telephoneNumber))
        self.callNumberContainer.addSubview(callNumberView!)
//        height += (callNumberView?.frame.size.height)!
        
        let stationNumberView = Bundle.main.loadNibNamed("WorkOrderStaticView", owner: self, options: nil)?[0] as? WorkOrderStaticView
        stationNumberView?.initUI(parameter: ("Station Number", ""))
        self.stationNumberContainer.addSubview(stationNumberView!)
        
        let siteAddressView = Bundle.main.loadNibNamed("WorkOrderStaticView", owner: self, options: nil)?[0] as? WorkOrderStaticView
        siteAddressView?.initUI(parameter: ("Site Address", ""))
        self.siteAddressContainer.addSubview(siteAddressView!)
        
        let zipCodeView = Bundle.main.loadNibNamed("WorkOrderStaticView", owner: self, options: nil)?[0] as? WorkOrderStaticView
        zipCodeView?.initUI(parameter: ("Zip Code", ""))
        self.zipCodeContainer.addSubview(zipCodeView!)
        
        let phoneNumberView = Bundle.main.loadNibNamed("WorkOrderStaticView", owner: self, options: nil)?[0] as? WorkOrderStaticView
        phoneNumberView?.initUI(parameter: ("Phone Number", ""))
        self.phoneNumberContainer.addSubview(phoneNumberView!)
        
        let techNumberView = Bundle.main.loadNibNamed("WorkOrderStaticView", owner: self, options: nil)?[0] as? WorkOrderStaticView
        techNumberView?.initUI(parameter: ("Tech Number", ""))
        self.TechNumberContainer.addSubview(techNumberView!)
        
        self.layoutIfNeeded()
        self.setNeedsLayout()
        
//        self.contentSize = CGSize(width: (callNumberView?.frame.size.width)!, height: height)
        
        
    }

}
