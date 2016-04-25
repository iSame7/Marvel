//
//  FilterCharactersTableViewController.swift
//  Marvel
//
//  Created by Sameh Mabrouk on 4/24/16.
//  Copyright © 2016 smapps. All rights reserved.
//

import UIKit

class SearchCharactersTableViewController: UITableViewController{

    let searchController = UISearchController(searchResultsController: nil)

//    @IBOutlet private weak var tableView: UITableView!

    var filteredCandies = [Candy]()

    // MARK: - Properties
    var detailViewController: DetailViewController? = nil
    var candies = [Candy]()

    // MARK: - View Setup
    override func viewDidLoad() {
        super.viewDidLoad()

        // Setup the Search Controller
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar

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
        
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

        // Hide navigation bar while swip up, or show navigation bar while swip down.
        navigationController?.hidesBarsOnSwipe = false

        searchController.active = true
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table View
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.active && searchController.searchBar.text != "" {
            return filteredCandies.count
        }
        return candies.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        let candy: Candy
        if searchController.active && searchController.searchBar.text != "" {
            candy = filteredCandies[indexPath.row]
        } else {
            candy = candies[indexPath.row]
        }
        cell.textLabel?.text = candy.name
        cell.detailTextLabel?.text = candy.category
        return cell
    }

    func filterContentForSearchText(searchText: String) {
        filteredCandies = candies.filter { candy in
            return candy.name.lowercaseString.containsString(searchText.lowercaseString)
        }

        tableView.reloadData()
    }
}

extension SearchCharactersTableViewController: UISearchResultsUpdating {
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        self.filterContentForSearchText(searchController.searchBar.text!)
    }
}

// MARK: - UISearchBarDelegate
extension SearchCharactersTableViewController: UISearchBarDelegate {
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        print("searchBarCancelButtonClicked")
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
