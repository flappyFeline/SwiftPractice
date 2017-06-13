//
//  NewsTableViewController.swift
//  Project 08 - SimpleRSSReader
//
//  Created by Durand on 10/6/17.
//  Copyright © 2017年 com.Durand. All rights reserved.
//

import UIKit


class NewsTableViewController: UITableViewController {

    
    fileprivate let feedParser = FeedParser();
    fileprivate let feedURL = "http://www.apple.com/main/rss/hotnews/hotnews.rss";
    
    fileprivate var rssItems: [item]?;
    fileprivate var cellStates: [CellState]?;
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.estimatedRowHeight = 140;
        tableView.rowHeight = UITableViewAutomaticDimension;
        
        tableView.separatorStyle = UITableViewCellSeparatorStyle.singleLine;
        
        feedParser.parseFeed(feedURL: feedURL) { [weak self] (rssItems) in
            self?.rssItems = rssItems;
            self?.cellStates = Array(repeating: .collapsed, count: rssItems.count);
            
            DispatchQueue.main.async {
                self?.tableView.reloadSections(IndexSet(integer: 0), with: .none);
            }
        }
        
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
            
            if let cellState = cellStates?[indexPath.row] {
                cell.descriptionLabel.numberOfLines = cellState == .expanded ? 0 : 4;
            }
        }
        
        
        return cell;
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! NewsTableViewCell;
        
        let cellState_ = cellStates?[indexPath.row];
        guard var cellState = cellState_ else { return; }
        tableView.beginUpdates();
        switch cellState {
        case .collapsed :
            cell.descriptionLabel.numberOfLines = 0;
            cellState = .expanded;
        case .expanded :
            cell.descriptionLabel.numberOfLines = 4;
            cellState = .collapsed;
        }
        cellStates?[indexPath.row] = cellState;
        tableView.endUpdates();
    }
}
