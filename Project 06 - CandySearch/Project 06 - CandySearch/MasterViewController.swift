//
//  MasterViewController.swift
//  Project 06 - CandySearch
//
//  Created by Durand on 22/4/17.
//  Copyright © 2017年 com.Durand. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController, UISearchBarDelegate {
    

    var detailViewController: UIViewController? = nil
    let searchController = UISearchController(searchResultsController: nil);
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        setUpSearchController();
    }
    
    func setUpSearchController() {
        searchController.searchResultsUpdater = self;
        searchController.dimsBackgroundDuringPresentation = false;
        definesPresentationContext = true;
        tableView.tableHeaderView = searchController.searchBar;
        searchController.searchBar.scopeButtonTitles = ["All", "Chocolate", "Hard", "Other"]
        searchController.searchBar.delegate = self
    }
}

extension MasterViewController: UISearchResultsUpdating {
    public func updateSearchResults(for searchController: UISearchController) {
        
    }
}
