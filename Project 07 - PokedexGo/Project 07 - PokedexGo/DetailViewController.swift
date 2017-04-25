//
//  DetailViewController.swift
//  Project 07 - PokedexGo
//
//  Created by Durand on 24/4/17.
//  Copyright © 2017年 com.Durand. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!

    var pokemon: Pokemon! {
        didSet (newPokemon) {
            //self.refreshUI()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let detail = self.detailItem {
            if let label = self.detailDescriptionLabel {
                label.text = detail.description
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var detailItem: Pokemon? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }


}

extension DetailViewController: PokemonSelectionDelegate {
    func pokemonSelected(_ newPokemon: Pokemon) {
        pokemon = newPokemon
    }
}

