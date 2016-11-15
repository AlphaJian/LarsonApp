//
//  TimeSheetView.swift
//  LarsonApp
//
//  Created by Jian Zhang on 11/14/16.
//  Copyright © 2016 Jian Zhang. All rights reserved.
//

import UIKit

class TimeSheetView: UIView {

    @IBOutlet weak var tableviewContainer: UIView!
    @IBOutlet weak var totalLbl: UILabel!
    var tableview : TimeSheetTableView?
    
    var addHandler : ButtonTouchUpBlock?
    func initUI(timeSheetArr : NSMutableArray){
        self.layoutIfNeeded()
        tableview = TimeSheetTableView(frame: tableviewContainer.bounds, style: .plain)
        tableview?.dataItems = timeSheetArr
        tableviewContainer.addSubview(tableview!)
        
        totalLbl.text = "Total: \(PartsManager.shareManager.countTotalTimeSheet()) minutes"
    }

    @IBAction func addTapped(_ sender: AnyObject) {
        if addHandler != nil
        {
            addHandler!()
        }
    }
}
