//
//  FilterCharactersTableViewController.swift
//  Marvel
//
//  Created by Sameh Mabrouk on 4/25/16.
//  Copyright © 2016 smapps. All rights reserved.
//

import UIKit

protocol FilterTableViewDelegate {
    func delegateForCell(selectedItemIndex: Int)
}

class FilterCharactersTableViewController: UITableViewController {

    var delegate:FilterTableViewDelegate?

    // limit that manges marvel number of resources loaded per request.
    var limit = KMarvelResourcesLimit

    // array of characters.
    var characters = [Character]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // background
        tableView.backgroundColor = UIColor.colorFromRGB(39, g: 43, b: 47)

        /* 
        Table views show separators between empty rows by default, which looks quite strange when you have only a handful of visible rows.
         What's actually happening is that you're creating an empty UIView and making it act as the footer of the table – this is the bottom most thing visible in the table. When iOS reaches the bottom of the cells you provide, it draws this view at the end rather than drawing empty rows and their separators, so it totally clears up the problem.
         */
        tableView.tableFooterView = UIView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("numberOfRowsInSection")
        return self.characters.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let cell:FilterTableViewCell = tableView.dequeueReusableCellWithIdentifier("FilterCell") as! FilterTableViewCell
        cell.character = self.characters[indexPath.row]

        return cell
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.delegate?.delegateForCell(indexPath.row)
    }

}

extension FilterCharactersTableViewController: UISearchResultsUpdating {
    func updateSearchResultsForSearchController(searchController: UISearchController) {

        if let searchText = searchController.searchBar.text {
            if searchText != "" {
                MarvelFactory().filterCharacters(limit, name: searchText, completionHandler: { (characters) in
                    
                    self.characters = characters
                    self.tableView.reloadData()

                }) { (error) -> Void in

                    let nsError = error as! NSError

                    let alert = UIAlertController(title: "Error", message: nsError.localizedDescription, preferredStyle: UIAlertControllerStyle.Alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
                    alert.addAction(defaultAction)
                    self.presentViewController(alert, animated: true, completion: nil)
                }
            }

        }

    }
}

// MARK: - UISearchBarDelegate
extension FilterCharactersTableViewController: UISearchBarDelegate {
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
    }
}
