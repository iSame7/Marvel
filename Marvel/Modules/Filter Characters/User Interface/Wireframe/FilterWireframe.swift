//
//  FilterWireframe.swift
//  Marvel
//
//  Created by Sameh Mabrouk on 4/25/16.
//  Copyright © 2016 smapps. All rights reserved.
//

import UIKit

/***
 Routes from one screen to another are defined in the wireframes created by an interaction designer. In VIPER, the responsibility for Routing is shared between two objects: the Presenter, and the wireframe. A wireframe object owns the UIWindow, UINavigationController, UIViewController, etc. It is responsible for creating a View/ViewController and installing it in the window.
 */

let FilterCharactersTableViewControllerIdentifier = "FilterCharacters"

class FilterWireframe: NSObject {

    var detailsWireframe : DetailsWireframe?
    var filterPresenter : FilterPresenter?
    var listViewController : ListCharactersViewController?

    func presentFilterInterfaceFromViewController(viewController: UIViewController) {

        listViewController = viewController as? ListCharactersViewController

        let searchResultsController = filterCharactersTableViewController()
        searchResultsController.eventHandler = filterPresenter
        filterPresenter?.userInterface = searchResultsController
//        newViewController.modalPresentationStyle = .Custom
//        newViewController.transitioningDelegate = self

        //let navController = UINavigationController(rootViewController: searchResultsController) // Creating a navigation controller with VC1 at the root of the navigation stack.

        // Init UISearchController with the search results controller
        let searchController = UISearchController(searchResultsController: searchResultsController)
        // Link the search controller
        searchController.searchResultsUpdater = searchResultsController
        // This is obviously needed because the search bar will be contained in the navigation bar
        searchController.hidesNavigationBarDuringPresentation = true
        // Required (?) to set place a search bar in a navigation bar
        searchController.searchBar.searchBarStyle = UISearchBarStyle.Prominent
        // This is where you set the search bar in the navigation bar, instead of using table view's header ...
        //        self.navigationItem.titleView = searchController.searchBar
        // To ensure search results controller is presented in the current view controller
        //        searchController.definesPresentationContext = true

        searchController.delegate = filterPresenter
        searchController.dimsBackgroundDuringPresentation = true

        // This line do the trick of diplaying UISearchController using a button action and wothout SearchBar.
        viewController.presentViewController(searchController, animated: true, completion: nil)

    }

    func PresentDetailsInterface(selectedCellIndex: Int, characters: [Character]) {
        // Ask Details wireframe to navigate to MarvelHeroesDetailsTableViewController.
        detailsWireframe?.navigateToDetailsInterfaceFromViewController(listViewController!, selectedCellIndex: selectedCellIndex, characters: characters)
    }

    func filterCharactersTableViewController() -> FilterCharactersTableViewController {
        let storyboard = mainStoryboard()
        let addViewController: FilterCharactersTableViewController = storyboard.instantiateViewControllerWithIdentifier(FilterCharactersTableViewControllerIdentifier) as! FilterCharactersTableViewController
        return addViewController
    }

    func mainStoryboard() -> UIStoryboard {
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        return storyboard
    }
}
