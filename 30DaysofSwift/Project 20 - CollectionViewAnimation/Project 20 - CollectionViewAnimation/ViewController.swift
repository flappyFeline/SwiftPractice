//
//  ViewController.swift
//  Project 20 - CollectionViewAnimation
//
//  Created by Durand on 16/6/17.
//  Copyright © 2017年 com.Durand. All rights reserved.
//

import UIKit

private let AnimationCellIdentifier = "testcc";

class ViewController: UIViewController {

    lazy var collectionView: UICollectionView = {
        let c = UICollectionView(frame: .zero, collectionViewLayout: YCHCollectionViewLayout());
        c.dataSource = self;
        c.delegate = self;
        c.isPrefetchingEnabled = false;
        c.backgroundColor = .yellow;
        c.register(UICollectionViewCell.self, forCellWithReuseIdentifier: AnimationCellIdentifier);
        return c;
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow;
        view.addSubview(self.collectionView);
        collectionView.frame = view.bounds;
    }
    
    class YCHCollectionViewLayout: UICollectionViewFlowLayout {
        override func prepare() {
            super.prepare();
            
            minimumLineSpacing = 0;
            minimumInteritemSpacing = 0;
            scrollDirection = .vertical;
            itemSize = CGSize(width: collectionView!.bounds.size.width - 30, height: 210);
            
        }
    }
    
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AnimationCellIdentifier, for: indexPath);
        cell.backgroundColor = .randomColor;
        return cell;
    }
    
    
    
}

extension UIColor {
    class var randomColor: UIColor {
        return UIColor.init(red: CGFloat(arc4random() % 256) / 255.0, green: CGFloat(arc4random() % 256) / 255.0, blue: CGFloat(arc4random() % 256) / 255.0, alpha: 1.0);
    }
}

