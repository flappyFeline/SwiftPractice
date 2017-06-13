//
//  ClearTableViewCell.swift
//  Project 11 - ClearTableViewCell
//
//  Created by Durand on 2017/6/14.
//  Copyright © 2017年 Durand. All rights reserved.
//

import UIKit

class ClearTableViewCell: UITableViewCell {
    
    let gradientLayer = CAGradientLayer();
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style , reuseIdentifier: reuseIdentifier);
        
        let color1 = UIColor.init(white: 1.0, alpha: 0.2).cgColor;
        let color2 = UIColor.init(white: 1.0, alpha: 0.1).cgColor;
        let color3 = UIColor.clear.cgColor;
        let color4 = UIColor.init(white: 0.0, alpha: 0.05).cgColor;
        
        gradientLayer.colors = [color1,color2,color3,color4];
        gradientLayer.locations = [0.0,0.04,0.95,1.0];
        layer.insertSublayer(gradientLayer, at: 0);
    }
    
    override func layoutSubviews() {
        super.layoutSubviews();
        gradientLayer.frame = self.bounds;
    }
    
    
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
