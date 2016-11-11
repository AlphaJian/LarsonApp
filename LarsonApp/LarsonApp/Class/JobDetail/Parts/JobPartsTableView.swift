//
//  JobPartsTableView.swift
//  LarsonApp
//
//  Created by Jian Zhang on 11/8/16.
//  Copyright © 2016 Jian Zhang. All rights reserved.
//

import UIKit
import QuartzCore

class JobPartsTableView: UITableView, UITableViewDelegate, UITableViewDataSource {

    var dataItems = NSMutableArray()
    
    var buttonTapHandler : ButtonTouchUpBlock?
    
    var partDeleteHandler : CellTouchUpBlock?
    
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        self.delegate = self
        self.dataSource = self
        self.register(UINib(nibName: "JobPartsTableViewCell", bundle: nil) , forCellReuseIdentifier: "JobPartsTableViewCell")
        self.separatorStyle = .none
        
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: self.width() - 70, y: self.height() - 130, width: 50, height: 50)
        button.setImage(UIImage(named: "Add"), for: .normal)
        button.addTarget(self, action: #selector(JobPartsTableView.addPartTapped(_:)), for: .touchUpInside)
        self.addSubview(button)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataItems.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let dic = dataItems[section] as! NSDictionary
        let str = dic.allKeys[0] as! String
        return (dic.value(forKey: str) as! NSArray).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "JobPartsTableViewCell") as! JobPartsTableViewCell
        
        let dic = dataItems[indexPath.section] as! NSDictionary
        let str = dic.allKeys[0] as! String
        let arr = dic.value(forKey: str) as! NSArray
        let model = arr[indexPath.row] as! PartModel
        cell.initUI(model: model, index: indexPath)
        
        cell.deleteHandler = {(index, model) -> Void in
            if self.partDeleteHandler != nil
            {
                self.partDeleteHandler!(index, model)
            }
        }
        
        
        return cell
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.width(), height: 38))
        view.backgroundColor = StringUtil.getColorWithRGB(red: 235, green: 235, blue: 235)
        let lbl = UILabel(frame: CGRect(x: 20, y: 0, width: view.width() - 20, height: 40))
        lbl.backgroundColor = UIColor.clear
        let dic = dataItems[section] as! NSDictionary
        lbl.text = dic.allKeys[0] as? String
        view.addSubview(lbl)
        
        view.layer.shadowOpacity = 0.5
        view.layer.shadowColor = UIColor.gray.cgColor
        view.layer.shadowRadius = 3
        view.layer.shadowOffset = CGSize(width: 1, height: 1)
        
        return view
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func addPartTapped(_ sender : UIButton)
    {
        if buttonTapHandler != nil
        {
            buttonTapHandler!()
        }
    }
}
