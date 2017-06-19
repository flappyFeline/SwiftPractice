//
//  PatternCell.swift
//  Project 21 - SwipeableCell
//
//  Created by Durand on 19/6/17.
//  Copyright © 2017年 com.Durand. All rights reserved.
//

import UIKit

struct pattern {
    let image: String;
    let name: String;
}

class PatternCell: UITableViewCell {

    @IBOutlet weak var patternImageView: UIImageView!
    @IBOutlet weak var patternNameLabel: UILabel!
    
}
