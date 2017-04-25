//
//  MasterViewController.swift
//  Project 07 - PokedexGo
//
//  Created by Durand on 24/4/17.
//  Copyright © 2017年 com.Durand. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class LibraryAPI: NSObject {
    static let shareInstance = LibraryAPI();
    
    func getPokemons() -> [Pokemon] {
        return pokemons;
    }
}

protocol PokemonSelectionDelegate: class {
    func pokemonSelected(_ newPokemon: Pokemon);
}

class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
    var pokemons = LibraryAPI.shareInstance.getPokemons();
    var filteredPokemons = [Pokemon]()
    
    weak var delegate: PokemonSelectionDelegate?
    
    fileprivate var disposeBag = DisposeBag();

    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        self.navigationItem.leftBarButtonItem = self.editButtonItem
//        if let split = self.splitViewController {
//            let controllers = split.viewControllers
//            self.detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
//        }
        setupUI();
        
        filteredPokemons = pokemons;
    }
    
    fileprivate func setupUI() {
        self.title = "精灵列表";
        
        definesPresentationContext = true;
        
        searchBar
            .rx.text.throttle(0.5, scheduler: MainScheduler.instance).subscribe(onNext: { [unowned self] query in
                if query?.characters.count == 0 {
                    self.filteredPokemons = self.pokemons;
                } else {
                    self.filteredPokemons = self.pokemons.filter({ $0.name.hasPrefix(query!) });
                }
                self.tableView.reloadData();
            }).addDisposableTo(disposeBag);
    }

    override func viewWillAppear(_ animated: Bool) {
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }

    

    // MARK: - Table View
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let pokemon = self.filteredPokemons[indexPath.row];
        delegate?.pokemonSelected(pokemon);
        
        if let detailViewController = self.delegate as? DetailViewController {
            splitViewController?.showDetailViewController(detailViewController.navigationController!, sender: nil);
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredPokemons.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MasterTableViewCell;
        
        let pokemon = filteredPokemons[indexPath.row];
        cell.awakeFromNib(pokemon.id, name: pokemon.name, pokeImageUrl: pokemon.pokeImgUrl);
        return cell
    }


}

