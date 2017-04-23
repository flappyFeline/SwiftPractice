//
//  DetailViewController.swift
//  Project 06 - CandySearch
//
//  Created by Durand on 23/4/17.
//  Copyright © 2017年 com.Durand. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!
    @IBOutlet weak var candyImageView: UIImageView!
    
    var detailCandy: Candy? {
        didSet {
            configView();
        }
    }
    
    func configView() {
        if let detailCandy = detailCandy {
            if let detailDescriptionLabel = detailDescriptionLabel, let candyImageView = candyImageView {
                detailDescriptionLabel.text = detailCandy.name;
                candyImageView.image = UIImage(named: detailCandy.name);
                title = detailCandy.category;
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView();
    }
    
}
