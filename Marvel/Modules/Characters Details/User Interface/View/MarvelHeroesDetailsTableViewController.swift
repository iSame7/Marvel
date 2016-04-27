//
//  MarvelHeroesDetailsTableViewController.swift
//  Marvel
//
//  Created by Sameh Mabrouk on 4/20/16.
//  Copyright © 2016 smapps. All rights reserved.
//

import UIKit
import Haneke
import ImageViewer

//Default Blur Settings.
let blurRadious:CGFloat = 25.0
let blurTintColor:UIColor = UIColor(white: 0, alpha: 0.75)
let blurDeltaFactor:CGFloat = 1.4

class MarvelHeroesDetailsTableViewController: ParallaxTableViewController, TableViewCellDelegate{

    // Selected character ID from ListCharactersViewController.
    var charachterId:String?

    // Selected character image path from ListCharactersViewController.
    var selectedCharacterImagePath:String?

    // Selected character urls from ListCharactersViewController.
    var selectedCharacterUrls = [Url]()

    // Selected character from ListCharactersViewController.
    var selectedCharacterObj:Character?

    // Event handler or Presenter
    var eventHandler:DetailsModuleInterface?

    private var imagePreviewer: ImageViewer!

    private var comics = [Comic]()
    private var series = [Series]()
    private var stories = [Stories]()
    private var events = [Events]()


    init(charachterId: String) {
        self.charachterId = charachterId
        super.init(nibName: nil, bundle: nil)
    }

    required init(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)!;
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

        // Just set navigationBarHidden = flase to show navigation bar in case of user swip up in first screen. 
        self.navigationController?.navigationBarHidden = false

        // Hide navigation bar while swip up, or show navigation bar while swip down.
        navigationController?.hidesBarsOnSwipe = false
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

        // Update view.
        eventHandler?.updateView(limit: 0, characterId: self.charachterId!)
        eventHandler?.updateViewWithCharacterSeries(limit: 0, characterId: self.charachterId!)
        eventHandler?.updateViewWithCharacterStories(limit: 0, characterId: self.charachterId!)
        eventHandler?.updateViewWithCharacterEvents(limit: 0, characterId: self.charachterId!)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()
    }


    func configureView() {

        /*  Navigation Bar setup */

        // Change the navigation bar background color according to mockup.
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.translucent = true

        // Navigation item image.
        if var image = UIImage(named: "icn-nav-search") {
            // Use the always original rendering mode, if you don't want the navigation bar's tintColor property to effect your bar button's color.
            image = UIImage(named:"icn-nav-back-white")!.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
            self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style: UIBarButtonItemStyle.Plain, target: self, action: #selector(MarvelHeroesDetailsTableViewController.backPressed))
        }

        // Set the parallex image
        self.imageView.hnk_setImageFromURL(NSURL(string: selectedCharacterImagePath!)!)

        let imageView = UIImageView(frame: self.view.frame)

        // Set table view background image.

        let URL = NSURL(string: selectedCharacterImagePath!)!
        let fetcher = NetworkFetcher<UIImage>(URL: URL)
        let cache = Shared.imageCache
        cache.fetch(fetcher: fetcher).onSuccess { image in
            // Do something with image
            var reponseImage = image
            reponseImage = reponseImage.applyBlurWithRadius(blurRadious, tintColor: blurTintColor, saturationDeltaFactor: blurDeltaFactor, maskImage: nil)!
            imageView.contentMode = UIViewContentMode.ScaleAspectFill
            imageView.image = reponseImage
            self.tableView.backgroundView = imageView
            self.view.insertSubview(imageView, atIndex: 0)

        }

    }

    // MARK: - Actions

    func backPressed() {
        self.navigationController?.popViewControllerAnimated(true)
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return Catalog.sharedInstance.categories.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 5 {
            return (self.selectedCharacterObj?.urls.count)!
        }
        else {
            return 1
        }

    }

    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return Catalog.sharedInstance.categories[section]
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let retCell:UITableViewCell

        if indexPath.section == 0 {
            // NAME AND DESCRIPTION SECTION
            let cell:CharacterDetailsTopCellTableViewCell = tableView.dequeueReusableCellWithIdentifier("topCell") as! CharacterDetailsTopCellTableViewCell
            cell.character = self.selectedCharacterObj
            retCell = cell

        }
        else if indexPath.section == 5 {
            // RELATED LINKS SECTION
            let cell:RelatedLinksTableViewCell = tableView.dequeueReusableCellWithIdentifier("relatedLinksCell") as! RelatedLinksTableViewCell
            cell.url = self.selectedCharacterUrls[indexPath.row]
            retCell = cell

        }
        else {

            // CHARACTER CATEGORIES SECTIONS
            let cell = tableView.dequeueReusableCellWithIdentifier("cell") as! CategoryRow
            cell.tag = indexPath.section
            cell.delegate = self

            if indexPath.section == 1 {
                cell.characterComics = self.comics
            }
            else if indexPath.section == 2 {
                cell.characterSeries = self.series
            }
            else if indexPath.section == 3 {
                cell.characterStories = self.stories
            }
            else {
                cell.characterEvents = self.events
            }

            retCell = cell
        }

        return retCell
    }

    // MARK: - Table view Delegate

    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        let view = UIView() // The width will be the same as the cell, and the height should be set in tableView:heightForRowAtIndexPath:

        let label                                       = UILabel()
        label.textColor                                 = UIColor.redColor()
        label.font                                      = UIFont.boldSystemFontOfSize(15.0)
        label.text                                      = Catalog.sharedInstance.categories[section]
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)

        // Standard Programmatic Layout
        // Autolayout equation: label.left = (view.left * multiplier) + constant
        let constraintToAnimate: NSLayoutConstraint = NSLayoutConstraint(item: label, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.Left, multiplier: 1, constant: 10)

        let bottomConstraintToAnimate: NSLayoutConstraint = NSLayoutConstraint(item: label, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: -5)
        view.addConstraint(constraintToAnimate)
        view.addConstraint(bottomConstraintToAnimate)
        return view

    }

    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.section == 0 {
            // NAME AND DESCRIPTION SECTION
            return 150
        }
        else if indexPath.section == 5 {
            // RELATED LINKS SECTION
            return 45
        }
        else {
            // CHARACTER CATEGORIES SECTIONS
            return 200
        }
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.section == 5 {
            // RELATED LINKS SECTION
            // Open safari browser for every related link.
            let url:Url = self.selectedCharacterUrls[indexPath.row]
            UIApplication.sharedApplication().openURL(NSURL(string: url.url)!)

            self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
        }
        else {


        }

    }

    // MARK: TableViewCellDelegate

    // Delegate method that tell our view controller that a CategoryRow cell has been clicked.
    func delegateForCell(imageClicked: UIImageView, cellTag: Int, selectedItemIndex: Int) {

        imagesUrls = [String]()
        chractersNames = [String]()

        if cellTag == 1 {
            for comic in self.comics {
                imagesUrls.append((comic.thumbnail?.path)! + "." + (comic.thumbnail?.thumbExtension)!)
                chractersNames.append(comic.title)
            }
        }

        if cellTag == 2 {
            for series in self.series {
                imagesUrls.append((series.thumbnail?.path)! + "." + (series.thumbnail?.thumbExtension)!)
                chractersNames.append(series.title)
            }
        }

        if cellTag == 3 {
            for stories in self.stories {
                if let thumb = stories.thumbnail {
                    imagesUrls.append((thumb.path)! + "." + (thumb.thumbExtension)!)
                    chractersNames.append(stories.title)
                }

            }
        }

        if cellTag == 4 {
            for events in self.events {
                imagesUrls.append((events.thumbnail?.path)! + "." + (events.thumbnail?.thumbExtension)!)
                chractersNames.append(events.title)
            }
        }

        // There are images to be displayed.
        if imagesUrls.count > 0 {

            let imageProvider = SomeImageProvider()
            let footerView:CounterView
            let frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 60)

            footerView = CounterView(frame: frame, currentIndex: selectedItemIndex, count: imagesUrls.count, name: chractersNames[selectedItemIndex])

            let galleryViewController = GalleryViewController(imageProvider: imageProvider, displacedView: imageClicked, imageCount: imagesUrls.count, startIndex: selectedItemIndex)
            galleryViewController.footerView = footerView

            galleryViewController.launchedCompletion = {

            }
            galleryViewController.closedCompletion = {

            }
            galleryViewController.swipedToDismissCompletion = {

            }

            galleryViewController.landedPageAtIndexCompletion = { index in
                //print("LANDED AT INDEX: \(index)")
                footerView.currentIndex = index
                footerView.name = chractersNames[index]
            }

            self.eventHandler?.openImageViewer(galleryViewController)
        }

    }

    override func scrollViewWillEndDragging(scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        if velocity.y > 0 {

            // Dragging up
            // Remove navigation bar.
            self.navigationController?.navigationBar.setBackgroundImage(nil, forBarMetrics: UIBarMetrics.Default)
            self.navigationController?.navigationBar.shadowImage = nil
            self.navigationController?.navigationBar.tintColor = nil
            self.navigationController?.navigationBar.translucent = true

            // show title
            self.title = selectedCharacterObj?.name

        }
        else {
            // Dragging down
            // Show Transparent navigation bar.
            self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
            self.navigationController?.navigationBar.shadowImage = UIImage()
            self.navigationController?.navigationBar.translucent = true

            self.title = ""
        }
    }

}

// MARK: - MarvelHeroesDetailsTableViewController DetailsViewInterface extension

extension MarvelHeroesDetailsTableViewController: DetailsViewInterface {
    func showCharacterComics(comics: [Comic]) {
        self.comics = comics
        self.tableView.reloadData()
    }

    func showCharacterSeries(series: [Series]) {
        self.series = series
        self.tableView.reloadData()
    }

    func showCharacterStories(stories: [Stories]) {
        self.stories = stories
        self.tableView.reloadData()
    }

    func showCharacterEvents(events: [Events]) {
        self.events = events
        self.tableView.reloadData()
    }
}

// MARK: - SomeImageProvider

var imagesUrls = [String]()
var chractersNames = [String]()

class SomeImageProvider: ImageProvider {
    
    func provideImage(completion: UIImage? -> Void) {
        completion(UIImage(named: "image_big"))
    }
    
    func provideImage(atIndex index: Int, completion: UIImage? -> Void) {
        
        let URL = NSURL(string: imagesUrls[index])!
        let fetcher = NetworkFetcher<UIImage>(URL: URL)
        let cache = Shared.imageCache
        cache.fetch(fetcher: fetcher).onSuccess { image in
            // Do something with image
            completion(image)
            
        }
        
    }
}
