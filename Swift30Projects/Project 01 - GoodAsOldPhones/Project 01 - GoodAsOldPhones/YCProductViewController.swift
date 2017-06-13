//
//  YCProductViewController.swift
//  Project 01 - GoodAsOldPhones
//
//  Created by Durand on 30/3/17.
//  Copyright © 2017年 com.Durand. All rights reserved.
//

import UIKit

class YCProductViewController: UIViewController {

    fileprivate lazy var productImageView: UIImageView = {
        let iv = UIImageView();
        iv.contentMode = UIViewContentMode.scaleAspectFit;
        return iv;
    }();
    
    fileprivate lazy var productNameLabel: UILabel = {
        let label = UILabel();
        label.textAlignment = NSTextAlignment.center;
        label.textColor = UIColor.orange;
        label.font = UIFont.systemFont(ofSize: 30);
        return label;
    }();
    
    fileprivate lazy var addCarBtn: UIButton = {
        let btn = UIButton();
//        btn.setTitle("ADD TO CART", for: .normal);
//        btn.titleLabel?.textColor = UIColor.white;
        btn.setBackgroundImage(UIImage( named:"button-addtocart"), for: .normal);
        return btn;
    }();
    
    public var product: YCProduct? {
        didSet {
            if let imageName = product?.fullScreenImageName {
                productImageView.image = UIImage(named: imageName);
            }
            productNameLabel.text = product?.name;
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        productImageView.frame = view.bounds;
        view.addSubview(productImageView);
        
        let viewW = view.bounds.width;
        productNameLabel.frame = CGRect(x: 0, y: 90, width: viewW, height: 60);
        view.addSubview(productNameLabel);
        
        let btnW: CGFloat = 160;
        addCarBtn.frame = CGRect(x: (viewW - btnW) * 0.5, y: productNameLabel.frame.maxY + 50, width: btnW, height: 41)
        view.addSubview(addCarBtn);
//        self.hidesBottomBarWhenPushed = true;
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
