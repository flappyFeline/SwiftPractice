//
//  YCContactViewController.swift
//  Project 01 - GoodAsOldPhones
//
//  Created by Durand on 30/3/17.
//  Copyright © 2017年 com.Durand. All rights reserved.
//



import UIKit

class YCContactViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.addSubview(scrollView);
        view.backgroundColor = UIColor.white;
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated);
//        scrollView?.contentSize = CGSize(width: 414, height: 800);
//    }
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        print("frame: " + "\(scrollView!.frame)\n" + "contentSize: " + "\(scrollView!.contentSize)\n");
//        
//    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews();
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews();
//        scrollView?.frame = view.bounds;
        scrollView?.contentSize = CGSize(width: 0, height: 800);
    }

}
