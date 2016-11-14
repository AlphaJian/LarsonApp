//
//  TimeSheetTableViewCell.swift
//  LarsonApp
//
//  Created by Jian Zhang on 11/14/16.
//  Copyright © 2016 Jian Zhang. All rights reserved.
//

import UIKit

class TimeSheetTableViewCell: UITableViewCell {

    @IBOutlet weak var statusImg: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var timeSpendLbl: UILabel!
    @IBOutlet weak var timeFromLbl: UILabel!
    
    var timesheetModel : TimesheetModel?
    var indexPath : IndexPath?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func initUI(model : TimesheetModel, index : IndexPath){
        timesheetModel = model
        indexPath = index
        
        if model.payCode == kTimeSheetTravel
        {
            statusImg.image = UIImage(named: "timesheet_drive")
        }
        else
        {
            statusImg.image = UIImage(named: "timesheet_tech")
        }
        titleLbl.text = model.payCode
        timeSpendLbl.text = "\(model.totalTime) minutes"
        timeFromLbl.text = "\(model.startTime) - \(model.endTime)"
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
