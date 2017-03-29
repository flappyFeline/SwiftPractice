//
//  YCProduct.swift
//  Project 01 - GoodAsOldPhones
//
//  Created by Durand on 29/3/17.
//  Copyright © 2017年 com.Durand. All rights reserved.
//

import UIKit

class YCProduct {
    var name: String?
    var cellImageName: String?
    var fullScreenImageName: String?
    
    init(_ name: String, cellImageName: String, fullScreenImageName: String) {
        self.name = name;
        self.cellImageName = cellImageName;
        self.fullScreenImageName = fullScreenImageName;
    }

}
