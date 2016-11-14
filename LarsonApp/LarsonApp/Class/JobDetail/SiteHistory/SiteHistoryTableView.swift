//
//  JobPartsTableView.swift
//  LarsonApp
//
//  Created by Jian Zhang on 11/8/16.
//  Copyright © 2016 Jian Zhang. All rights reserved.
//

import UIKit

class SiteHistoryTableView: UITableView, UITableViewDelegate, UITableViewDataSource {
    
    var dataItems = NSMutableDictionary()
    
    var buttonTapHandler : ButtonTouchUpBlock?
    var partDeleteHandler : CellTouchUpBlock?
    
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        
       
        self.delegate = self
        self.dataSource = self
        self.separatorStyle = .none
        
        self.register(SiteHistoryTableViewCell.self, forCellReuseIdentifier: "SiteHistoryTableViewCell")
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataItems.allKeys.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            let arr = dataItems.value(forKey: "location-sitehistories") as! NSArray
            return arr.count
        } else if section == 1 {
            let arr = dataItems.value(forKey: "location-pastNotes") as! NSArray
            return arr.count
        } else if section == 2 {
            let arr = dataItems.value(forKey: "location-equipment") as! NSArray
            return arr.count
        } else {
            return 0
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: SiteHistoryTableViewCell = (tableView.dequeueReusableCell(withIdentifier: "SiteHistoryTableViewCell") as? SiteHistoryTableViewCell)!
        cell.selectionStyle = .none
        cell.clearCell()
        cell.frame = CGRect(x: 0, y: 0, width: self.width(), height: 60)
        
        if indexPath.section == 0 {
            let arr = dataItems.value(forKey: "location-sitehistories") as! NSArray
            let model: SiteHistoryModel = arr[indexPath.row] as! SiteHistoryModel
            cell.initSiteUI(model: model, index: indexPath)
            
        } else if indexPath.section == 1 {
            let arr = dataItems.value(forKey: "location-pastNotes") as! NSArray
            let model: SiteHistoryNotesModel = arr[indexPath.row] as! SiteHistoryNotesModel
            cell.initNotesUI(model: model, index: indexPath)
            
            
        } else if indexPath.section == 2 {
            let arr = dataItems.value(forKey: "location-equipment") as! NSArray
            let model: SiteHistoryEquipModel = arr[indexPath.row] as! SiteHistoryEquipModel
            cell.initEquipUI(model: model, index: indexPath)
            
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
        return "Site History"
        } else if section == 1 {
            return "Past Technician Notes"
        } else if section == 2 {
           return "Equipment"
        } else {
            return "aaaa"
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var height = CGFloat()
        
        if indexPath.section == 0 {
            let arr = dataItems.value(forKey: "location-sitehistories") as! NSArray
            let model: SiteHistoryModel = arr[indexPath.row] as! SiteHistoryModel
            height = model.cellHeight
            
        } else if indexPath.section == 1 {
            let arr = dataItems.value(forKey: "location-pastNotes") as! NSArray
            let model: SiteHistoryNotesModel = arr[indexPath.row] as! SiteHistoryNotesModel
           height = model.cellHeight
        } else if indexPath.section == 2 {
            let arr = dataItems.value(forKey: "location-equipment") as! NSArray
            let model: SiteHistoryEquipModel = arr[indexPath.row] as! SiteHistoryEquipModel
            height = model.cellHeight
        }

        
        
        
        return height
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            let arr = dataItems.value(forKey: "location-sitehistories") as! NSArray
            let model: SiteHistoryModel = arr[indexPath.row] as! SiteHistoryModel
            model.isOpen = !model.isOpen
            model.getCellHeight()
            reloadRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
            
        } else if indexPath.section == 1 {
            let arr = dataItems.value(forKey: "location-pastNotes") as! NSArray
            let model: SiteHistoryNotesModel = arr[indexPath.row] as! SiteHistoryNotesModel
            model.isOpen = !model.isOpen
            model.getCellHeight()
            reloadRows(at: [indexPath], with: UITableViewRowAnimation.automatic)

            
        } else if indexPath.section == 2 {
            let arr = dataItems.value(forKey: "location-equipment") as! NSArray
            let model: SiteHistoryEquipModel = arr[indexPath.row] as! SiteHistoryEquipModel
            model.isOpen = !model.isOpen
            model.getCellHeight()
            reloadRows(at: [indexPath], with: UITableViewRowAnimation.automatic)

        }

    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let head = view as! UITableViewHeaderFooterView
        head.contentView.backgroundColor = UIColor.white
        head.textLabel?.font = UIFont.boldSystemFont(ofSize: 13)
        
    }
    
}
