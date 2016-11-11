//
//  WorkOrderTableView.swift
//  LarsonApp
//
//  Created by Perry Z Chen on 11/10/16.
//  Copyright © 2016 Jian Zhang. All rights reserved.
//

import UIKit

enum EnumTableViewCell: Int{
    case CallNumberCell = 0
    case StationCell
    case SiteAddressCell
    case ZipCell
    case phoneNumCell
    case techNumCell
    case ServiceDescCell
    case WorkDescCell
    case SectionCount
}

class WorkOrderTableView: UITableView {

    var model: AppointmentModel?
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        self.delegate = self
        self.dataSource = self
        self.backgroundColor = UIColor(red: 236.0/255.0, green: 240/255.0, blue: 241/255.0, alpha: 1.0)
        
        self.register(UINib(nibName: "StaticWorkOrderCell", bundle: nil), forCellReuseIdentifier: "StaticWorkOrderCell")
        self.register(UINib(nibName: "InputWorkOrderCell", bundle: nil), forCellReuseIdentifier: "InputWorkOrderCell")
        
        self.rowHeight = UITableViewAutomaticDimension
        self.estimatedRowHeight = 60.0
        self.separatorStyle = .none
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardChangeFrame(notification:)), name: .UIKeyboardWilflChangeFrame, object: nil)

    }
    
    func keyboardChangeFrame(notification: Notification) {
        let dicUserInfo = notification.userInfo
        print(dicUserInfo?[UIKeyboardAnimationDurationUserInfoKey] ?? 48)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("")
    }
    

}

extension WorkOrderTableView : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return EnumTableViewCell.SectionCount.rawValue
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == EnumTableViewCell.CallNumberCell.rawValue {
            let cell = tableView.dequeueReusableCell(withIdentifier: "StaticWorkOrderCell", for: indexPath) as! StaticWorkOrderCell
            cell.initUI(parameter: ("Call Number", (self.model?.telephoneNumber)!))
            return cell
        } else if indexPath.section == EnumTableViewCell.StationCell.rawValue {
            let cell = tableView.dequeueReusableCell(withIdentifier: "StaticWorkOrderCell", for: indexPath) as! StaticWorkOrderCell
            cell.initUI(parameter: ("Station Number", (self.model?.stationNumber)!))
            return cell
        } else if indexPath.section == EnumTableViewCell.SiteAddressCell.rawValue {
            let cell = tableView.dequeueReusableCell(withIdentifier: "StaticWorkOrderCell", for: indexPath) as! StaticWorkOrderCell
            cell.initUI(parameter: ("Site Address", (self.model?.customerAddress)!))
            return cell
        } else if indexPath.section == EnumTableViewCell.ZipCell.rawValue {
            let cell = tableView.dequeueReusableCell(withIdentifier: "StaticWorkOrderCell", for: indexPath) as! StaticWorkOrderCell
            cell.initUI(parameter: ("Zip Code", (self.model?.zipCode)!))
            return cell
        } else if indexPath.section == EnumTableViewCell.phoneNumCell.rawValue {
            let cell = tableView.dequeueReusableCell(withIdentifier: "StaticWorkOrderCell", for: indexPath) as! StaticWorkOrderCell
            cell.initUI(parameter: ("Phone Number", (self.model?.telephoneNumber)!))
            return cell
        } else if indexPath.section == EnumTableViewCell.ServiceDescCell.rawValue {
            let cell = tableView.dequeueReusableCell(withIdentifier: "InputWorkOrderCell", for: indexPath) as! InputWorkOrderCell
            cell.initUI(parameter: ("Service Description", ""))
            cell.textViewUpdateBlock = { (str: AnyObject) in
                let currentOffset = tableView.contentOffset
                UIView.setAnimationsEnabled(false)
                tableView.beginUpdates()
                tableView.endUpdates()
                UIView.setAnimationsEnabled(true)
                tableView.setContentOffset(currentOffset, animated: false)
            }
            return cell
        } else if indexPath.section == EnumTableViewCell.WorkDescCell.rawValue {
            let cell = tableView.dequeueReusableCell(withIdentifier: "InputWorkOrderCell", for: indexPath) as! InputWorkOrderCell
            cell.initUI(parameter: ("Work Description", ""))
            cell.textViewUpdateBlock = { (str: AnyObject) in
                let currentOffset = tableView.contentOffset
                UIView.setAnimationsEnabled(false)
                tableView.beginUpdates()
                tableView.endUpdates()
                UIView.setAnimationsEnabled(true)
                tableView.setContentOffset(currentOffset, animated: false)
            }
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "StaticWorkOrderCell", for: indexPath) as! StaticWorkOrderCell
            cell.initUI(parameter: ("Tech Number", (self.model?.techNumber)!))
            return cell
        }
    }
}

extension WorkOrderTableView : UITableViewDelegate {
    
}
