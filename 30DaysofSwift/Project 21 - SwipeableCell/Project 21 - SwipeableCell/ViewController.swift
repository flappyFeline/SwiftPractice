//
//  ViewController.swift
//  Project 21 - SwipeableCell
//
//  Created by Durand on 19/6/17.
//  Copyright © 2017年 com.Durand. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    lazy var baseData = [
        pattern(image: "1", name: "Pattern Building"),
        pattern(image: "2", name: "Joe Beez"),
        pattern(image: "3", name: "Car It's car"),
        pattern(image: "4", name: "Floral Kaleidoscopic"),
        pattern(image: "5", name: "Sprinkle Pattern"),
        pattern(image: "6", name: "Palitos de queso"),
        pattern(image: "7", name: "Ready to Go? Pattern"),
        pattern(image: "8", name: "Sets Seamless"),
        ];
    
    var data: [pattern]!;
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil);
        data = baseData;
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
        data = baseData;
    }
    
    override func viewDidLoad() {
        let insertBtn = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addItem));
        self.navigationItem.rightBarButtonItem = insertBtn;
    }
    
    func addItem() {
        if baseData.count == 0 {
            print("basedata is empty");
            return;
        }
        let randomIndex = Int(arc4random()) % baseData.count;
        let insertItem = baseData[randomIndex];
        data.append(insertItem);
        self.tableView.insertRows(at: [IndexPath(row: data.count - 1, section: 0)], with: .automatic);
    }
    
}

extension ViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count;
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PatternCell", for: indexPath) as! PatternCell;
        
        let pattern = data[indexPath.row];
        cell.patternImageView.image = UIImage.init(named: pattern.image);
        cell.patternNameLabel.text = pattern.name;
        return cell;
    }

    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction(style: .normal, title: "🗑\nDelete") { (action, index) in
            print("Delete button tapped");
            self.data.remove(at: index.row);
            tableView.deleteRows(at: [index], with: .automatic);
        }
        
        delete.backgroundColor = .gray;
        
        let share = UITableViewRowAction(style: .normal, title: "🤗\nShare") { (action: UITableViewRowAction!, indexPath: IndexPath) in
            
            let firstActivityItem = self.data[indexPath.row];
            
            let activityVewController = UIActivityViewController(activityItems: [firstActivityItem.image as NSString], applicationActivities: nil);
            
            self.present(activityVewController, animated: true, completion: nil);
        }
        
        share.backgroundColor = .red;
        
        let download = UITableViewRowAction(style: .normal, title: "⬇️\nDownload") { (action, index) in
            print("Download button tapped");
        }
        download.backgroundColor = .blue;
        
        
        return [delete, share, download];
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true;
    }
    
    
    
}

