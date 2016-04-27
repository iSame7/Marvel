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

    var strongCollectionView: UICollectionView?

    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.strongCollectionView = self.collectionView
        configureView()
    }


    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

        eventHandler?.updateView(limit: limit)
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

        self.navigationController?.navigationBar.setBackgroundImage(nil, forBarMetrics: UIBarMetrics.Default)
        self.navigationController?.navigationBar.shadowImage = nil
        self.navigationController?.navigationBar.tintColor = nil
        self.navigationController?.navigationBar.translucent = true

        // Hide navigation bar while swip up, or show navigation bar while swip down.
        navigationController?.hidesBarsOnSwipe = true

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

        eventHandler?.searchCharacters()
        
        self.navigationItem.titleView?.hidden = true
        self.navigationItem.rightBarButtonItem = nil
    }



}

extension ListCharactersViewController: ListViewInterface {

    func showCharacters(characters: [Character]) {

        self.view = self.strongCollectionView
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
/*
        // show details view controller.
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let viewController = storyboard.instantiateViewControllerWithIdentifier("MarvelHeroesDetails") as! MarvelHeroesDetailsTableViewController
        print("charachterId... \(self.characters[indexPath.item].id)")
        viewController.charachterId = String(self.characters[indexPath.row].id)
        viewController.selectedCharacterImagePath = self.characters[indexPath.row].thumbnail.path! + "." + self.characters[indexPath.row].thumbnail.thumbExtension!
        viewController.selectedCharacterUrls = self.characters[indexPath.row].urls
        viewController.selectedCharacterObj = self.characters[indexPath.row]

        self.navigationController?.pushViewController(viewController, animated: true)
 */
        eventHandler?.openDetailsView(indexPath.item, characters: self.characters)
    }
}

extension ListCharactersViewController: UISearchControllerDelegate {

    func didDismissSearchController(searchController: UISearchController) {
        self.navigationItem.titleView?.hidden = false
        self.navigationItem.rightBarButtonItem = rightBarButton
    }
}

