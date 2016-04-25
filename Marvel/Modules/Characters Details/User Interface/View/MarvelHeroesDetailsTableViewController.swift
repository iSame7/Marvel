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
let blurRadious:CGFloat = 14.0
let blurTintColor:UIColor = UIColor(white: 0, alpha: 0.9)
let blurDeltaFactor:CGFloat = 1.4

class MarvelHeroesDetailsTableViewController: ParallaxTableViewController, TableViewCellDelegate{

    var categories = ["COMICS", "SERIES", "Science Fiction", "Kids", "Horror"]

    var charachterId:String?

    var selectedCharacterImagePath:String?

    var selectedCharacterUrls = [Url]()

    var selectedCharacterObj:Character?

    var comics = [Comic]()
    var series = [Series]()
    var stories = [Stories]()
    var events = [Events]()

    private var imagePreviewer: ImageViewer!

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

        // Hide navigation bar while swip up, or show navigation bar while swip down.
        navigationController?.hidesBarsOnSwipe = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
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
            imageView.image = reponseImage
            self.tableView.backgroundView = imageView
            self.view.insertSubview(imageView, atIndex: 0)

        }

        self.getCharacterComics(self.charachterId!)
        self.getCharacterSeries(self.charachterId!)
        self.getCharacterStories(self.charachterId!)
        self.getCharacterEvents(self.charachterId!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Actions

    func backPressed() {
        self.navigationController?.popViewControllerAnimated(true)
    }

    func getCharacterComics(characterId: String) {
        MarvelFactory().charactersComics(0, charachterId: characterId, completionHandler: { (comics) in
            self.comics = comics
            self.tableView.reloadData()
        }) { (error) in

        }
    }

    func getCharacterSeries(characterId: String) {
        MarvelFactory().charactersSeries(0, charachterId: characterId, completionHandler: { (series) in
            self.series = series
            self.tableView.reloadData()
        }) { (error) in

        }
    }

    func getCharacterStories(characterId: String) {
        MarvelFactory().charactersStories(0, charachterId: characterId, completionHandler: { (stories) in
            print("stories \(stories.count)")
            self.stories = stories
            self.tableView.reloadData()
        }) { (error) in

        }
    }

    func getCharacterEvents(characterId: String) {
        MarvelFactory().charactersEvents(0, charachterId: characterId, completionHandler: { (events) in
            self.events = events
            self.tableView.reloadData()
        }) { (error) in

        }
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

    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
/*
        let label : UILabel = UILabel()
        label.textColor     = UIColor.redColor()
        label.font          = UIFont.boldSystemFontOfSize(15.0)
        label.text          = Catalog.sharedInstance.categories[section]

        label.translatesAutoresizingMaskIntoConstraints = false

        let constraintToAnimate: NSLayoutConstraint = NSLayoutConstraint(item: label, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.Left, multiplier: 0.25, constant: 30)
        label.addConstraint(constraintToAnimate)

        return label
 */

        let view = UIView() // The width will be the same as the cell, and the height should be set in tableView:heightForRowAtIndexPath:

        let label                                       = UILabel()
        label.textColor                                 = UIColor.redColor()
        label.font                                      = UIFont.boldSystemFontOfSize(15.0)
        label.text                                      = Catalog.sharedInstance.categories[section]
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        
        // Autolayout Visual Format
//        let horizontallayoutContraints = NSLayoutConstraint.constraintsWithVisualFormat("H:|-10-[label]-60-[button]-10-|", options: .AlignAllCenterY, metrics: nil, views: views)
//        view.addConstraints(horizontallayoutContraints)

        // Standard Programmatic Layout
        // Autolayout equation: label.left = (view.left * multiplier) + constant
        let constraintToAnimate: NSLayoutConstraint = NSLayoutConstraint(item: label, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.Left, multiplier: 1, constant: 10)

        let bottomConstraintToAnimate: NSLayoutConstraint = NSLayoutConstraint(item: label, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: -5)
        view.addConstraint(constraintToAnimate)
        view.addConstraint(bottomConstraintToAnimate)
        return view

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
            print("Category section \(indexPath.section)")
            // CHARACTER CATEGORIES SECTIONS
            let cell = tableView.dequeueReusableCellWithIdentifier("cell") as! CategoryRow
            cell.tag = indexPath.section
            cell.delegate = self

//            cell.charachterId = self.charachterId

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
//            else {
//                cell.characterComics = self.comics
//            }
            retCell = cell
        }



        //        cell.getComics(self.charachterId!)
        return retCell
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

    func delegateForCell(imageClicked: UIImageView, cellTag: Int, selectedItemIndex: Int) {

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

        galleryViewController.launchedCompletion = { print("LAUNCHED") }
        galleryViewController.closedCompletion = { print("CLOSED") }
        galleryViewController.swipedToDismissCompletion = { print("SWIPE-DISMISSED") }

        galleryViewController.landedPageAtIndexCompletion = { index in
            print("LANDED AT INDEX: \(index)")
            footerView.currentIndex = index
            footerView.name = chractersNames[index]
        }


            self.presentImageGallery(galleryViewController)
        }

    }

}

class SomeImageProvider: ImageProvider {

    func provideImage(completion: UIImage? -> Void) {
        completion(UIImage(named: "image_big"))
    }

    func provideImage(atIndex index: Int, completion: UIImage? -> Void) {

        print("imageURL \(imagesUrls[index])")
        let URL = NSURL(string: imagesUrls[index])!
        let fetcher = NetworkFetcher<UIImage>(URL: URL)
        let cache = Shared.imageCache
        cache.fetch(fetcher: fetcher).onSuccess { image in
            // Do something with image
            //            self.image[index] = image
            print("Image featched")
            completion(image)

        }

    }
    //        completion(images[index])
}

let images = [
    UIImage(named: ""),
    UIImage(named: ""),
    UIImage(named: ""),
    UIImage(named: ""),
    UIImage(named: ""),
    UIImage(named: ""),
    UIImage(named: ""),
    UIImage(named: "")]

/*
var imagesUrls = [
    "http://i.annihil.us/u/prod/marvel/i/mg/6/20/52602f21f29ec.jpg",
    "http://i.annihil.us/u/prod/marvel/i/mg/9/50/4ce18691cbf04.jpg",
    "",
    "",
    "",
    "",
    "",
    ""]
 */

var imagesUrls = [String]()
var chractersNames = [String]()

