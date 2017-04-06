//
//  YCProductsViewController.swift
//  Project 01 - GoodAsOldPhones
//
//  Created by Durand on 29/3/17.
//  Copyright © 2017年 com.Durand. All rights reserved.
//

import UIKit

let kProductCellIdentifier = "kProductCellIdentifier";

class YCProductsTableViewController: UITableViewController {

    fileprivate var products: [YCProduct]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: kProductCellIdentifier);

        products = [
            YCProduct(name: "1907 Wall Set", cellImageName: "image-cell1", fullScreenImageName: "phone-fullscreen1"),
            YCProduct(name: "1921 Dial Phone", cellImageName: "image-cell2", fullScreenImageName: "phone-fullscreen2"),
            YCProduct(name: "1937 Desk Set", cellImageName: "image-cell3", fullScreenImageName: "phone-fullscreen3"),
            YCProduct(name: "1984 Moto Portable", cellImageName: "image-cell4", fullScreenImageName: "phone-fullscreen4")
        ];
//        for i in 0...10 {
//            let string = "这是第" + "\(i)" + "个";
//            dataArray.append(string);
//        }
        
    }

    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = YCProductViewController();
        vc.product = products?[indexPath.row];
        vc.hidesBottomBarWhenPushed = true;
        
        navigationController?.pushViewController(vc, animated: true);
        tableView .deselectRow(at: indexPath, animated: true);
    }

    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120;
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1;
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let products = products {
            return products.count;
        }
        return 0;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: kProductCellIdentifier);
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: kProductCellIdentifier);
            cell?.accessoryType = UITableViewCellAccessoryType.disclosureIndicator;
        }
        let product = products?[indexPath.row];
        cell?.textLabel?.text = products?[indexPath.row].name;
        if let imageName = product?.cellImageName {
            cell?.imageView?.image = UIImage(named: imageName);
        }
        return cell!;
    }

}
