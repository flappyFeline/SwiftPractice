//
//  ViewController.swift
//  Project 08 - SimpleRSSReader
//
//  Created by Durand on 15/5/17.
//  Copyright © 2017年 com.Durand. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let three = YCTestEnum.Three;
        print("\(three)");
        
        let one = YCEnum.YCEnumOne(start: 1.0, end: 2.0);
        switch one {
        case let .YCEnumOne(s,e):
            print("start = \(s), end = \(e)");
        case let .YCEnumTwo(s,e):
            print("start = \(s), end = \(e)");
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

enum YCEnum {
    case YCEnumOne(start: Double, end: Double);
    case YCEnumTwo(start: Double, end: Double);
}

enum YCTestEnum: Int {
    
    case One = 1;
    case Two = 2;
    case Three, Four, Five
    func testEnum() -> String {
        switch self {
        case .Three:
            return "Three11";
        case .Four:
            return "Three22";
        case .Five:
            return "Three33";
        default:
            return String(self.rawValue);
        }
    }
    
}

