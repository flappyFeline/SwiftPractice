//
//  MasterTableViewCell.swift
//  PokedexGo
//
//  Created by Durand on 24/4/17.
//  Copyright © 2017年 com.Durand. All rights reserved.
//

import UIKit

class MasterTableViewCell: UITableViewCell {
    
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var pokeImageView: UIImageView!
    
    func awakeFromNib(_ id: Int, name: String, pokeImageUrl: String) {
        super.awakeFromNib();
        setUpUI(id, name: name);
    }

    fileprivate func setUpUI(_ id: Int, name: String) {
        idLabel.text = NSString(format: "#%03d", id) as String;
        nameLabel.text = name;
        pokeImageView.image = UIImage(named: "default_img");
        
    }
    
}
