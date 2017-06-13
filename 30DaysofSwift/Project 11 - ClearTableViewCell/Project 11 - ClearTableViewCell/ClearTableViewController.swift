//
//  ViewController.swift
//  Project 11 - ClearTableViewCell
//
//  Created by Durand on 2017/6/14.
//  Copyright © 2017年 Durand. All rights reserved.
//

import UIKit

let kClearTableViewCellID = "clearcell";

class ClearTableViewController: UITableViewController {

    let tableData = ["Read 3 article on Medium", "Cleanup bedroom", "Go for a run", "Hit the gym", "Build another swift project", "Movement training", "Fix the layout problem of a client project", "Write the experience of #30daysSwift", "Inbox Zero", "Booking the ticket to Chengdu", "Test the Adobe Project Comet", "Hop on a call to mom"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(ClearTableViewCell.self, forCellReuseIdentifier: kClearTableViewCellID)
        self.tableView.backgroundColor = UIColor.groupTableViewBackground;
        self.tableView.separatorStyle = .none;
        self.tableView.tableFooterView = UIView.init(frame: .zero);
        self.tableView.rowHeight = 60;
    }
    
    func colorForIndexPath(_ indexPath: IndexPath) -> UIColor {
        let itemCount = tableData.count - 1;
        let color = (CGFloat(indexPath.row) / CGFloat(itemCount)) * 0.6;
        return UIColor.init(red: 1.0, green: color, blue: 0.0, alpha: 1.0);
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView .dequeueReusableCell(withIdentifier: kClearTableViewCellID, for: indexPath);
        cell.textLabel?.text = tableData[indexPath.row];
        cell.textLabel?.textColor = .white;
        cell.textLabel?.backgroundColor = .clear;
        cell.textLabel?.font = UIFont.init(name: "Avenir Next", size: 18);
        cell.selectionStyle = .none;
        cell.backgroundColor = colorForIndexPath(indexPath);
        return cell;
    }

}
