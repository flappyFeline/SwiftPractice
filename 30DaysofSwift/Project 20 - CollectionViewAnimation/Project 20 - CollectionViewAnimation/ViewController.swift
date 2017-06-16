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
//        c.register(AnimationCollectionViewCell.self, forCellWithReuseIdentifier: AnimationCellIdentifier);
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
    
    func handleAnimationCellSelected(_ collectionView: UICollectionView, cell: AnimationCollectionViewCell) {
        
        if cell.cellIsSelected {
            return;
        }
        
        cell.handleCellSelected();
        let preRect = cell.frame;
        
        cell.backButtonTapped = { [unowned self] in
            
            self.transitionCellWithAnimations({ 
                cell.frame = preRect;
                cell.resetElementStatus();
            }, completion: { (_) in
                self.collectionView.isScrollEnabled = true;
                
            });
        }
        
        
        
        let animations: () -> () = {
            cell.frame = collectionView.bounds;
        }
        
        let completion: (_ finished: Bool) -> Void = { _ in
            collectionView.isScrollEnabled = false;
        }
        
        transitionCellWithAnimations(animations, completion: completion);
    }
    
    func transitionCellWithAnimations(_ animations: @escaping () -> (), completion: @escaping (Bool) -> ()) {
        UIView.animate(withDuration: Constants.AnimationDuration,
                       delay: Constants.AnimationDelay,
                       usingSpringWithDamping: Constants.AnimationSpringDamping,
                       initialSpringVelocity: Constants.AnimationInitialSpringVelocity,
                       options: [],
                       animations: animations,
                       completion: completion);
    }
    
    func backButtonDidTouch() {
        guard let indexPaths = self.collectionView.indexPathsForSelectedItems else { return }
        
        collectionView.isScrollEnabled = true;
        collectionView.reloadItems(at: indexPaths);
    }
    
    fileprivate struct Constants {
        static let AnimationDuration: Double = 0.5
        static let AnimationDelay: Double = 0.0
        static let AnimationSpringDamping: CGFloat = 1.0
        static let AnimationInitialSpringVelocity: CGFloat = 1.0
    }


    class YCHCollectionViewLayout: UICollectionViewFlowLayout {
        override func prepare() {
            super.prepare();
            
            minimumLineSpacing = 30;
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
//        cell.backgroundColor = .randomColor;/\
        return cell;
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? AnimationCollectionViewCell else { return };
        
        self.handleAnimationCellSelected(collectionView, cell: cell);
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

