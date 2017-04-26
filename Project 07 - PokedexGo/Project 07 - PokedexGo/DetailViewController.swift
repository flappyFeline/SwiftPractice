//
//  DetailViewController.swift
//  Project 07 - PokedexGo
//
//  Created by Durand on 24/4/17.
//  Copyright © 2017年 com.Durand. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var nameIDLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var iconImageVIew: UIImageView!
    var pokemon: Pokemon! {
        didSet (newPokemon) {
            self.refreshUI()
        }
    }

    func refreshUI() {
        if pokemon == nil {
            return;
        }
        let idString = NSString(format: " #%03d", pokemon.id) as String;
        nameIDLabel?.text = pokemon.name + idString;
        iconImageVIew?.image = LibraryAPI.shareInstance.downloadImg(pokemon.pokeImgUrl);
        detailLabel?.text = pokemon.detailInfo;
        
        self.title = pokemon.name;
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        refreshUI();
    }


}

extension DetailViewController: PokemonSelectionDelegate {
    func pokemonSelected(_ newPokemon: Pokemon) {
        pokemon = newPokemon
    }
}

