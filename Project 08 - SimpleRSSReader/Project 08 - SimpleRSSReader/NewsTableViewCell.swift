//
//  NewsTableViewCell.swift
//  Project 08 - SimpleRSSReader
//
//  Created by Durand on 11/6/17.
//  Copyright © 2017年 com.Durand. All rights reserved.
//

import UIKit



enum CellState: Int {
    case expanded = 0;
    case collapsed;
}

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var newsTitle: UILabel!
    @IBOutlet weak var pubDate: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel! {
        didSet {
            descriptionLabel.numberOfLines = 4;
        }
    }
    
    var data: item? {
        willSet {
            newsTitle.text = newValue?.title;
            pubDate.text = newValue?.pubDate;
            descriptionLabel.text = newValue?.description;
        }
    }
    
    
}
