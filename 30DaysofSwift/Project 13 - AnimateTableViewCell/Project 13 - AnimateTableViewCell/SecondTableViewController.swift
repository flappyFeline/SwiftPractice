//
//  SecondTableViewController.swift
//  Project 13 - AnimateTableViewCell
//
//  Created by Durand on 2017/6/14.
//  Copyright © 2017年 Durand. All rights reserved.
//

import UIKit

class SecondTableViewController: FirstTableViewController {

    override init(style: UITableViewStyle) {
        super.init(style: style);
        tableData = ["Read 3 article on Medium", "Cleanup bedroom", "Go for a run", "Hit the gym", "Build another swift project", "Movement training", "Fix the layout problem of a client project", "Write the experience of #30daysSwift", "Inbox Zero", "Booking the ticket to Chengdu", "Test the Adobe Project Comet", "Hop on a call to mom"];
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
        tableData = ["Read 3 article on Medium", "Cleanup bedroom", "Go for a run", "Hit the gym", "Build another swift project", "Movement training", "Fix the layout problem of a client project", "Write the experience of #30daysSwift", "Inbox Zero", "Booking the ticket to Chengdu", "Test the Adobe Project Comet", "Hop on a call to mom"];
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func colorforIndex(_ index: Int) -> UIColor {
        
        let itemCount = tableData.count - 1
        let color = (CGFloat(index) / CGFloat(itemCount)) * 0.6
        return UIColor(red: 1.0, green: color, blue: 0.0, alpha: 1.0)
        
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true);
    }
}
