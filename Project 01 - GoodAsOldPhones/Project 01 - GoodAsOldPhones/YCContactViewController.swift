//
//  YCContactViewController.swift
//  Project 01 - GoodAsOldPhones
//
//  Created by Durand on 30/3/17.
//  Copyright © 2017年 com.Durand. All rights reserved.
//

import UIKit

class YCContactViewController: UIViewController {
    
    override func loadView() {
        view = UIScrollView(frame: UIScreen.main.bounds);
//        (view as! UIScrollView).contentSize = view.bounds.size;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let label = UILabel(frame: CGRect(x: 0, y: 100, width: 414, height: 60));
        label.text = "test";
        label.font = UIFont.systemFont(ofSize: 30);
        label.textAlignment = .center;
        label.textColor = UIColor.gray;
        
        view.addSubview(label);
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
