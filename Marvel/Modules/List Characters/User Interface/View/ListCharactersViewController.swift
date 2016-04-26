//
//  ListCharactersViewController.swift
//  Marvel
//
//  Created by Sameh Mabrouk on 4/16/16.
//  Copyright © 2016 smapps. All rights reserved.
//

import UIKit

class ListCharactersViewController: UICollectionViewController {

    // RightBarButton
    var rightBarButton: UIBarButtonItem?

    // array of characters.
    var characters = [Character]()

    // limit that manges marvel number of resources loaded per request.
    var limit = KMarvelResourcesLimit

    // Event handler or Presenter
    var eventHandler:ListModuleInterface?

    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()
    }


    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

        eventHandler?.updateView(limit: limit)
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

        // Hide navigation bar while swip up, or show navigation bar while swip down.
        //        navigationController?.hidesBarsOnSwipe = true

        /*  Navigation Bar setup */
        //        self.navigationController?.navigationBar.translucent = false
        // Change the navigation bar background color according to mockup.
        self.navigationController!.navigationBar.barTintColor = UIColor.colorFromRGB(0, g: 0, b: 0)
    }

    func configureView() {

        // Change status bar style to light.
        UIApplication.sharedApplication().statusBarStyle = .LightContent

        // title view
        self.navigationItem.titleView = UIImageView(image: UIImage(named: "icn-nav-marvel"))

        // Navigation item image.
        if var image = UIImage(named: "icn-nav-search") {
            // Use the always original rendering mode, if you don't want the navigation bar's tintColor property to effect your bar button's color.
            image = UIImage(named:"icn-nav-search")!.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
            rightBarButton =  UIBarButtonItem(image: image, style: UIBarButtonItemStyle.Plain, target: self, action: #selector(ListCharactersViewController.searchPressed))
            self.navigationItem.rightBarButtonItem = rightBarButton
        }

        // background
        collectionView!.backgroundColor = UIColor.colorFromRGB(39, g: 43, b: 47)
        collectionView!.decelerationRate = UIScrollViewDecelerationRateFast

        definesPresentationContext = true
    }

    // MARK: - Actions
    func searchPressed() {
        /*
         // show filter view controller.
         let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
         let viewController = storyboard.instantiateViewControllerWithIdentifier("MasterVC") as! FilterCharactersTableViewController
         //        self.navigationController?.pushViewController(viewController, animated: true)
         let navController = UINavigationController(rootViewController: viewController) // Creating a navigation controller with VC1 at the root of the navigation stack.
         navController.navigationBar.barTintColor = UIColor.colorFromRGB(0, g: 0, b: 0)


         self.presentViewController(navController, animated: true, completion: nil)
         */


        /*
         We want to display searchResultsController over current navigationItem.
         */
/*
        // Create a UITableViewController to present search results since the actual view controller is not a subclass of UITableViewController in this case
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let searchResultsController = storyboard.instantiateViewControllerWithIdentifier("FilterCharacters") as! FilterCharactersTableViewController
        searchResultsController.delegate = self

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

        // Setting delegates and other stuff
//        searchResultsController.tableView.dataSource = self
//        searchResultsController.tableView.delegate = self

        searchController.delegate = self
        searchController.dimsBackgroundDuringPresentation = true

        // This line do the trick of diplaying UISearchController using a button action and wothout SearchBar.
        presentViewController(searchController, animated: true, completion: nil)
*/
        eventHandler?.searchCharacters()
        
        self.navigationItem.titleView?.hidden = true
        self.navigationItem.rightBarButtonItem = nil
    }



}

extension ListCharactersViewController: ListViewInterface {

    func showCharacters(characters: [Character]) {
        self.characters = characters
        self.collectionView?.reloadData()
    }
}

extension ListCharactersViewController {

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return characters.count;
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("SlidingMenuCell", forIndexPath: indexPath) as! SlidingMenuCell
        cell.character = characters[indexPath.item]

        if (indexPath.row == self.characters.count - 1) {

            // scrolling indicator at last item.

            // Increase resources limit.
            limit = limit + KMarvelResourcesLimit

            eventHandler?.updateView(limit: limit)
        }

        return cell
    }

    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {

        // show details view controller.
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let viewController = storyboard.instantiateViewControllerWithIdentifier("MarvelHeroesDetails") as! MarvelHeroesDetailsTableViewController
        print("charachterId... \(self.characters[indexPath.item].id)")
        viewController.charachterId = String(self.characters[indexPath.row].id)
        viewController.selectedCharacterImagePath = self.characters[indexPath.row].thumbnail.path! + "." + self.characters[indexPath.row].thumbnail.thumbExtension!
        viewController.selectedCharacterUrls = self.characters[indexPath.row].urls
        viewController.selectedCharacterObj = self.characters[indexPath.row]

        self.navigationController?.pushViewController(viewController, animated: true)
    }
}

extension ListCharactersViewController: UISearchControllerDelegate {

    func didDismissSearchController(searchController: UISearchController) {
        self.navigationItem.titleView?.hidden = false
        self.navigationItem.rightBarButtonItem = rightBarButton
    }
}

