//
//  MasterViewController.swift
//  Project 06 - CandySearch
//
//  Created by Durand on 22/4/17.
//  Copyright © 2017年 com.Durand. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {
    

    var detailViewController: DetailViewController? = nil
    let searchController = UISearchController(searchResultsController: nil);
    var candies = [Candy]()
    var filteredCandies = [Candy]()
    override func viewDidLoad() {
        super.viewDidLoad();
        
        candies = [
            Candy(category:"Chocolate", name:"Chocolate Bar"),
            Candy(category:"Chocolate", name:"Chocolate Chip"),
            Candy(category:"Chocolate", name:"Dark Chocolate"),
            Candy(category:"Hard", name:"Lollipop"),
            Candy(category:"Hard", name:"Candy Cane"),
            Candy(category:"Hard", name:"Jaw Breaker"),
            Candy(category:"Other", name:"Caramel"),
            Candy(category:"Other", name:"Sour Chew"),
            Candy(category:"Other", name:"Gummi Bear")
        ]
        
        setUpSearchController();
        
        if let splitViewController = splitViewController {
            let controllers = splitViewController.viewControllers;
            detailViewController = (controllers[controllers.count - 1] as! UINavigationController).topViewController as? DetailViewController;
            
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed;
        super.viewWillAppear(animated);
    }
    
    func setUpSearchController() {
        searchController.searchResultsUpdater = self;
        searchController.dimsBackgroundDuringPresentation = false;
        definesPresentationContext = true;
        tableView.tableHeaderView = searchController.searchBar;
        searchController.searchBar.scopeButtonTitles = ["All", "Chocolate", "Hard", "Other"]
        searchController.searchBar.delegate = self
    }
    
    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
        filteredCandies = candies.filter({ (candy) -> Bool in
            if (candy.category != scope) && scope != "All" {
                return false;
            }
            
            return candy.name.lowercased().contains(searchText.lowercased()) || searchText == "";
        });
        
        tableView.reloadData();
    }
}

extension MasterViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.isActive {
            return filteredCandies.count;
        } else {
            return candies.count;
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuseID = "Cell";
        var cell = tableView.dequeueReusableCell(withIdentifier: reuseID);
        if (cell == nil) {
            cell = UITableViewCell.init(style: .subtitle, reuseIdentifier: reuseID);
        }
        var candy: Candy;
        if searchController.isActive {
            candy = filteredCandies[indexPath.row];
        } else {
            candy = candies[indexPath.row];
        }
        cell?.textLabel?.text = candy.name;
        cell?.detailTextLabel?.text = candy.category;
        return cell!;
    }

}

extension MasterViewController: UISearchResultsUpdating, UISearchBarDelegate {
    public func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar;
        let scopeTitle = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex];
        filterContentForSearchText(searchBar.text!, scope: scopeTitle);
    }
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        let scopeTitle = searchBar.scopeButtonTitles![selectedScope];
        filterContentForSearchText(searchBar.text!, scope: scopeTitle);
    }
}


