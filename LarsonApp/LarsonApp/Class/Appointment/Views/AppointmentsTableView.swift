//
//  AppointmentsTableView.swift
//  LarsonApp
//
//  Created by Jian Zhang on 11/1/16.
//  Copyright © 2016 Jian Zhang. All rights reserved.
//

import UIKit

class AppointmentsTableView: UITableView, UITableViewDelegate, UITableViewDataSource {

    var items = [AppointmentModel]()
    
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        self.delegate = self
        self.dataSource = self
//        self.register(QuestionReportTableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
        self.separatorStyle = .none
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil
        {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
        
        let model = items[indexPath.row] 
        cell?.textLabel?.text = model.legacyId
        
        return cell!
    }

}
