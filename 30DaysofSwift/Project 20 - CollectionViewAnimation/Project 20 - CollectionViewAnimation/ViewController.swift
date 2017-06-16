//
//  ViewController.swift
//  Project 20 - CollectionViewAnimation
//
//  Created by Durand on 16/6/17.
//  Copyright © 2017年 com.Durand. All rights reserved.
//

import UIKit

private let AnimationCellIdentifier = "AnimationCellIdentifier";

class ViewController: UIViewController {

    lazy var collectionView: UICollectionView = {
        let c = UICollectionView(frame: .zero, collectionViewLayout: YCHCollectionViewLayout());
        c.dataSource = self;
        c.delegate = self;
        c.isPrefetchingEnabled = false;
        c.backgroundColor = .yellow;
        c.register(AnimationCollectionViewCell.self, forCellWithReuseIdentifier: AnimationCellIdentifier);
        c.register(UINib(nibName: "AnimationCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: AnimationCellIdentifier);
        return c;
    }()
    
    var imageCollection: AnimationImaheCollection?;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow;
        view.addSubview(self.collectionView);
        collectionView.frame = view.bounds;
        
        imageCollection = AnimationImaheCollection();
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
        return imageCollection?.images.count ?? 0;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AnimationCellIdentifier, for: indexPath) as? AnimationCollectionViewCell, let viewModel = imageCollection?.images.safeIndex(indexPath.row) else { return AnimationCollectionViewCell(); }
        
        cell.prepareCell(viewModel);
        cell.backgroundColor = .randomColor;
        return cell;
    }
    
    
    
}

struct AnimationImaheCollection {
    fileprivate let imagePaths: [String] = {
        var tempArray = [String]();
        for i in 1...5 {
            tempArray.append("\(i)");
        }
        return tempArray;
    }();
    
    var images: [AnimationCellModel];
    
    init() {
        images = imagePaths.map{ AnimationCellModel($0) };
    }
}

extension Array {
    func safeIndex(_ i: Int) -> Element? {
        return i < self.count && i >= 0 ? self[i] : nil;
    }
}

extension UIColor {
    class var randomColor: UIColor {
        return UIColor.init(red: CGFloat(arc4random() % 256) / 255.0, green: CGFloat(arc4random() % 256) / 255.0, blue: CGFloat(arc4random() % 256) / 255.0, alpha: 1.0);
    }
}

