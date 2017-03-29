//
//  YCProductsViewController.swift
//  Project 01 - GoodAsOldPhones
//
//  Created by Durand on 29/3/17.
//  Copyright © 2017年 com.Durand. All rights reserved.
//

import UIKit

let kProductCellIdentifier = "kProductCellIdentifier";

class YCProductsViewController: UITableViewController {

    var dataArray = Array<Any>();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: kProductCellIdentifier);
        
        for i in 0...10 {
            let string = "这是第" + "\(i)" + "个";
            dataArray.append(string);
        }
        
    }

     override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1;
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: kProductCellIdentifier, for: indexPath);
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: kProductCellIdentifier);
        }
        cell.textLabel!.text = dataArray[indexPath.row] as! String;
        return cell;
    }

}
