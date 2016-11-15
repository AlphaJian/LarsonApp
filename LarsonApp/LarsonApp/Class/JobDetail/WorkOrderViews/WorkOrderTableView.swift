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
    case AddPartsCell
    case OptionCell
    case SectionCount
}

class WorkOrderTableView: UITableView {

    var model: AppointmentModel?
    var partItems: [Int] = [Int]()
    weak var vc: JobDetailViewController?
    var removeItemAlertHandler: ReturnBlock?
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
        self.register(UINib(nibName: "AddPartsCell", bundle: nil), forCellReuseIdentifier: "AddPartsCell")
        self.register(UINib(nibName: "PartItemCell", bundle: nil), forCellReuseIdentifier: "PartItemCell")
        self.register(UINib(nibName: "WorkOrderOptionCell", bundle: nil), forCellReuseIdentifier: "WorkOrderOptionCell")
        
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
        if section == EnumTableViewCell.AddPartsCell.rawValue {
            return 1 + partItems.count
        } else {
            return 1
        }
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
                self.updateCellWithTVEdit()
            }
            return cell
        } else if indexPath.section == EnumTableViewCell.WorkDescCell.rawValue {
            let cell = tableView.dequeueReusableCell(withIdentifier: "InputWorkOrderCell", for: indexPath) as! InputWorkOrderCell
            cell.initUI(parameter: ("Description of Work", ""))
            cell.textViewUpdateBlock = { (str: AnyObject) in
                self.updateCellWithTVEdit()
            }
            return cell
        } else if indexPath.section == EnumTableViewCell.AddPartsCell.rawValue {
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "AddPartsCell", for: indexPath) as! AddPartsCell
                cell.initUI(parameter: ("Add Parts Used"))
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "PartItemCell", for: indexPath) as! PartItemCell
                unowned let wself = self
                cell.removeItemBlock = { (str: AnyObject) in
                    wself.showRemoveItemAlert(title: "Are you sure delete?", indexToDelete: indexPath as NSIndexPath)
                }
                return cell
            }
            
        } else if indexPath.section == EnumTableViewCell.OptionCell.rawValue {
            let cell = tableView.dequeueReusableCell(withIdentifier: "WorkOrderOptionCell", for: indexPath) as! WorkOrderOptionCell
            //                cell.initUI(parameter: ("Add Parts Used"))
            return cell
        }
        
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "StaticWorkOrderCell", for: indexPath) as! StaticWorkOrderCell
            cell.initUI(parameter: ("Tech Number", (self.model?.techNumber)!))
            return cell
        }
    }

    // update cell after edit textview
    func updateCellWithTVEdit() {
        let currentOffset = self.contentOffset
        UIView.setAnimationsEnabled(false)
        self.beginUpdates()
        self.endUpdates()
        UIView.setAnimationsEnabled(true)
        self.setContentOffset(currentOffset, animated: false)
    }
    
    // 删除某个row
    func showRemoveItemAlert(title: String, indexToDelete: NSIndexPath) {
        let alertVC = UIAlertController(title: title, message: "", preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "ok", style: .default, handler: { (alert) in
            // 使用beginUpdates会crush，原因是indexpath没更新，
            // http://stackoverflow.com/questions/4497925/how-to-delete-a-row-from-uitableview  
            // 直接用reloadData
            let indexPath = NSIndexPath(row: indexToDelete.row, section: indexToDelete.section)
            self.partItems.remove(at: indexPath.row-1)
            self.deleteRows(at: [indexPath as IndexPath], with: .automatic)
            self.reloadData()
        })
        let cancelAction = UIAlertAction(title: "cancel", style: .cancel, handler: { (alert) in
            print(alert)
        })
        alertVC.addAction(confirmAction)
        alertVC.addAction(cancelAction)
        if vc != nil {
            vc?.present(alertVC, animated: true, completion: nil)
        }
    }
}


extension WorkOrderTableView : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == EnumTableViewCell.AddPartsCell.rawValue && indexPath.row == 0 {
            self.partItems.append(1)
            let indexPathItem = NSIndexPath(row: 1, section: indexPath.section)
            tableView.beginUpdates()
            tableView.insertRows(at: [indexPathItem as IndexPath], with: .automatic)
            tableView.endUpdates()
            // scroll to the item that just added
//            tableView.scrollToRow(at: indexPathItem as IndexPath, at: .bottom, animated: true)
        }
    }
}
