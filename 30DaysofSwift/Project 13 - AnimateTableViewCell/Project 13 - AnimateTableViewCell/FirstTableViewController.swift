//
//  FirstTableViewController.swift
//  Project 13 - AnimateTableViewCell
//
//  Created by Durand on 2017/6/14.
//  Copyright © 2017年 Durand. All rights reserved.
//

import UIKit

class FirstTableViewController: UITableViewController {

    var tableData = ["Personal Life", "Buddy Company", "#30 days Swift Project", "Body movement training", "AppKitchen Studio", "Project Read", "Others" ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        UIApplication.shared.isStatusBarHidden = true;
        
        view.backgroundColor = .black;
        tableView.separatorStyle = .none;
        tableView.tableFooterView = UIView.init(frame: .zero);
        tableView.register(FirstTableViewCell.self, forCellReuseIdentifier: "FirstCell");
        tableView.rowHeight = 60;
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tableData.count;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FirstCell", for: indexPath)
        
        cell.textLabel?.text = tableData[indexPath.row]
        cell.textLabel?.textColor = UIColor.white
        cell.textLabel?.backgroundColor = UIColor.clear
        cell.textLabel?.font = UIFont(name: "Avenir Next", size: 18)
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        cell.backgroundColor =  colorforIndex(indexPath.row)
        
    }
    
    func colorforIndex(_ index: Int) -> UIColor {
        
        let itemCount = tableData.count - 1
        let color = (CGFloat(index) / CGFloat(itemCount)) * 0.6
        return UIColor(red: color, green: 0.0, blue: 1.0, alpha: 1.0)
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true);
        
        showBySegue();
    }
    
    func showBySegue() {
        performSegue(withIdentifier: "ShowAnimationSegue", sender: nil);
    }
}
