//
//  AnimationCellModel.swift
//  Project 20 - CollectionViewAnimation
//
//  Created by Durand on 17/6/17.
//  Copyright © 2017年 com.Durand. All rights reserved.
//

import Foundation

struct AnimationCellModel {
    
    let imagePath: String
    
    init(_ imagePath: String?) {
        self.imagePath = imagePath ?? "";
    }
    
}
