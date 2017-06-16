//
//  AnimationCollectionViewCell.swift
//  Project 20 - CollectionViewAnimation
//
//  Created by Durand on 17/6/17.
//  Copyright © 2017年 com.Durand. All rights reserved.
//

import UIKit

class AnimationCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var backButton: UIButton! {
        didSet {
            backButton.addTarget(self, action: #selector(AnimationCollectionViewCell.backButtonDidTouch), for: .touchUpInside);
        }
    }
    @IBOutlet weak var animationImageView: UIImageView!
    @IBOutlet weak var animationTextView: UITextView!
    
    var backButtonTapped: (() -> Void)?;
    
    func prepareCell(_ viewModel: AnimationCellModel) {
        guard let img = UIImage(named: viewModel.imagePath) else {
            print("found nil warpping object \(viewModel.imagePath)");
            return
        }
        animationImageView.image = img;
        animationTextView.isScrollEnabled = false;
        backButton.isHidden = true;
    }
    
    func handleCellSelected() {
        animationTextView.isScrollEnabled = false;
        backButton.isHidden = false;
        self.superview?.bringSubview(toFront: self);
    }
    
    func backButtonDidTouch(_ sender: Any) {
        backButtonTapped?();
    }
    

}
