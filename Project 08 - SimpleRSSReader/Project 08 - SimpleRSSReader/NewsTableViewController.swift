//
//  NewsTableViewController.swift
//  Project 08 - SimpleRSSReader
//
//  Created by Durand on 10/6/17.
//  Copyright © 2017年 com.Durand. All rights reserved.
//

import UIKit


class NewsTableViewController: UITableViewController {

    
    fileprivate var rssItems: [item]?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
         return (rssItems != nil) ? rssItems!.count : 0;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath) as! NewsTableViewCell;
        
        if let item = rssItems?[indexPath.row] {
            cell.data = item;
        }
        
        return cell;
        
    }


}
