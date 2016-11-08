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
    
    var cellClickBlock: ReturnBlock?
    
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        self.delegate = self
        self.dataSource = self
        self.backgroundColor = UIColor(red: 236.0/255.0, green: 240/255.0, blue: 241/255.0, alpha: 1.0)
        
        self.register(UINib(nibName: "TodoAppointmentTableViewCell", bundle: nil), forCellReuseIdentifier: "TODO")
        self.register(UINib(nibName: "CompleteAppointmentTableViewCell", bundle: nil), forCellReuseIdentifier: "COMPLETE")
        self.rowHeight = UITableViewAutomaticDimension
        self.estimatedRowHeight = 60.0
        self.separatorStyle = .none
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let appointModel: AppointmentModel = items[indexPath.section]
        
        if appointModel.currentStatus.lowercased() == "completed" {
            let cell: CompleteAppointmentTableViewCell = tableView.dequeueReusableCell(withIdentifier: "COMPLETE", for: indexPath) as! CompleteAppointmentTableViewCell
            cell.setupCellData(model: appointModel)
            return cell
        } else {
            let cell: TodoAppointmentTableViewCell = tableView.dequeueReusableCell(withIdentifier: "TODO", for: indexPath) as! TodoAppointmentTableViewCell
            cell.setupCellData(model: appointModel)
            return cell
        }
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 5.0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let placeholderView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 5))
        placeholderView.backgroundColor = .clear
        return placeholderView
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == items.count - 1 {
            return 10.0
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let placeholderView = UIView()
        placeholderView.backgroundColor = .clear
        return placeholderView
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selecetedModel = items[indexPath.section]
        if self.cellClickBlock != nil {
            self.cellClickBlock!(selecetedModel)
        }
        
    }
    
}
