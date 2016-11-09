//
//  PartRequestContainerView.swift
//  LarsonApp
//
//  Created by Jian Zhang on 11/9/16.
//  Copyright © 2016 Jian Zhang. All rights reserved.
//

import UIKit

class PartRequestContainerView: UIScrollView {

    @IBOutlet weak var legacyIdLabel: UILabel!
    @IBOutlet weak var customerNameLbl: UILabel!
    @IBOutlet weak var addressLbl: UILabel!
    
    func initUpper(appointmentModel : AppointmentModel){
        legacyIdLabel.text = appointmentModel.legacyId
        customerNameLbl.text = appointmentModel.customerName
        addressLbl.text = appointmentModel.customerAddress
    }

}
