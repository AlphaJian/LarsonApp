//
//  OptionView.swift
//  JoeApp
//
//  Created by appledev018 on 3/24/16.
//  Copyright © 2016 PwC. All rights reserved.
//

import UIKit

class OptionView: UIView, UITableViewDelegate, UITableViewDataSource {
  
    @IBOutlet weak var slideContainer: UIView!

    @IBOutlet weak var greyView: UIView!
    @IBOutlet weak var headerViewContainer: UIView!
    @IBOutlet weak var slideTableView: UITableView!
    var items: NSMutableDictionary = ["0":"My Current Job", "1":"Messenger", "2":"Leaderboard", "3":"Job List", "4":"Logout", "didSelect": 0]
    var cellTouchUpHandler : CellTouchUpBlock?
    
    
    func initUI() {
        
    slideTableView.delegate = self
    slideTableView.dataSource = self
     slideTableView.registerNib(UINib(nibName: "SlideTableViewCell", bundle: nil), forCellReuseIdentifier: "SlideTableViewCell")
        self.layoutIfNeeded()

        let view =  NSBundle.mainBundle().loadNibNamed("SlideTableHeaderView", owner: self, options: nil)[0] as? SlideTableHeaderView
        
        view?.frame = headerViewContainer.bounds
        view?.initUI()
        headerViewContainer.addSubview(view!)
        view?.layoutIfNeeded()

        slideContainer.frame = CGRectMake(CGFloat(0 - LCDW + 70), 0, self.width(), LCDH)

        greyView.alpha = 0
    slideTableView.separatorStyle = UITableViewCellSeparatorStyle.None
    UIView.animateWithDuration(0.5, animations: { () -> Void in
        
        self.greyView.alpha = 0.5
        
        self.slideContainer.frame = CGRectMake(0, 0, self.width(), LCDH)
        }, completion: nil)

        
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: "handleSwipeGesture")
        swipeGesture.direction = UISwipeGestureRecognizerDirection.Left
        self.addGestureRecognizer(swipeGesture)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: "handleSwipeGesture")
        
        self.greyView.addGestureRecognizer(tapGesture)
        
        
    }
    
    
    func handleSwipeGesture(){
        DispatchQueue.main.asynchronously() {
            UIView.animate(withDuration: 0.5, animations: { () -> Void in
                
                self.greyView.alpha = 0
                
                self.slideContainer.setX(x: -LCDW)
            }) { (Bool) -> Void in
                self.removeFromSuperview()
            }
            
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count - 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        self.layoutIfNeeded()
        let cell = tableView.dequeueReusableCell(withIdentifier: "SlideTableViewCell") as! SlideTableViewCell
        cell.initUI(items: items, index: indexPath.row)
        
        return cell
        }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return CGFloat(48)
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
       
      let view = UIView()
        view.backgroundColor = UIColor.white
        
        return view
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(8)
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
       items["didSelect"] = indexPath.item
        tableView.reloadData()
        if indexPath.row == 0
        {
            //fetch current job

        }
        else
        {
            if cellTouchUpHandler != nil {
                cellTouchUpHandler!(indexPath,"" as AnyObject)
            }
        }
    }
    
    
}
