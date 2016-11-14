//
//  TimeSheetTableView.swift
//  LarsonApp
//
//  Created by Jian Zhang on 11/14/16.
//  Copyright © 2016 Jian Zhang. All rights reserved.
//

import UIKit

class TimeSheetTableView: UITableView, UITableViewDelegate, UITableViewDataSource {

    var dataItems = NSMutableArray()
    
    var buttonTapHandler : ButtonTouchUpBlock?
    
    var partDeleteHandler : CellTouchUpBlock?
    
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        self.delegate = self
        self.dataSource = self
        self.register(UINib(nibName: "TimeSheetTableViewCell", bundle: nil) , forCellReuseIdentifier: "TimeSheetTableViewCell")
        self.separatorStyle = .none
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TimeSheetTableViewCell") as! TimeSheetTableViewCell
        
        let model = dataItems[indexPath.row] as! TimesheetModel
        cell.initUI(model: model, index: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
