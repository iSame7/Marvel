//
//  CategoryRow.swift
//  Marvel
//
//  Created by Sameh Mabrouk on 4/21/16.
//  Copyright © 2016 smapps. All rights reserved.
//

import UIKit

protocol TableViewCellDelegate {
    func delegateForCell(imageClicked:UIImageView, cellTag: Int, selectedItemIndex: Int)
}
class CategoryRow: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!

    var delegate:TableViewCellDelegate?

    // array of Comics.
    var comics = [Comic]()
    var series = [Series]()
    var stories = [Stories]()
    var events = [Events]()

    var footerReusableView:FooterReusableView?

    let activityIndicator:UIActivityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.White)

    override func awakeFromNib() {
        print("awakeFromNib")
        super.awakeFromNib()
        // Initialization code

        collectionView!.registerClass(FooterReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: "FooterView")

    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    var characterComics: [Comic]? {
        didSet {
            if let marvelCharacterComics = characterComics {
                if let footerReusableView = self.footerReusableView {
                    footerReusableView.activityIndicator.stopAnimating()
                }
                self.comics = marvelCharacterComics
                self.collectionView.reloadData()
            }
        }
    }

    var characterSeries: [Series]? {
        didSet {
            if let marvelCharacterSeries = characterSeries {
                if let footerReusableView = self.footerReusableView {
                    footerReusableView.activityIndicator.stopAnimating()
                }
                self.series = marvelCharacterSeries
                self.collectionView.reloadData()
            }
        }
    }

    var characterStories: [Stories]? {
        didSet {
            if let marvelCharacterStories = characterStories {
                if let footerReusableView = self.footerReusableView {
                    footerReusableView.activityIndicator.stopAnimating()
                }
                self.stories = marvelCharacterStories
                self.collectionView.reloadData()
            }
        }
    }

    var characterEvents: [Events]? {
        didSet {
            if let marvelCharacterEvents = characterEvents {
                if let footerReusableView = self.footerReusableView {
                    footerReusableView.activityIndicator.stopAnimating()
                }
                self.events = marvelCharacterEvents
                self.collectionView.reloadData()
            }
        }
    }

    func getComics(characterId: String) {
        MarvelFactory().charactersComics(4, charachterId: characterId, completionHandler: { (comics) in

            self.comics = comics
            self.collectionView.reloadData()

            }) { (error) in

        }
    }

}

extension CategoryRow : UICollectionViewDataSource {

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if  self.tag == 1 {
            return self.comics.count
        }
        else if self.tag == 2 {
            return self.series.count
        }
        else if self.tag == 3 {
            return self.stories.count
        }
        else {
            return self.events.count
        }
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("characterSectionCell", forIndexPath: indexPath) as! CharacterSectionCollectionViewCell
        if  self.tag == 1 {
            /* 
             /* Handle loading more items while scrolling in Collection View */
             if (indexPath.item == self.comics.count - 1) {
             // scrolling indicator at last item.

             // Increase resources limit.

             let limit = Catalog.sharedInstance.limits[self.tag] + KMarvelResourcesLimit
             print("limit \(limit)")
             // Load new charachters.
             MarvelFactory().charactersComics(limit, charachterId: self.charachterId!, completionHandler: { (comics) in

             Catalog.sharedInstance.limits[self.tag] = limit

             self.comics = comics
             Catalog.sharedInstance.comics = comics

             self.collectionView?.reloadData()

             }) { (error) -> Void in

             }
             }

             */
            cell.comic = self.comics[indexPath.row]
        }
        else if self.tag == 2 {
            cell.series = self.series[indexPath.row]
        }
        else if self.tag == 3 {
            cell.stories = self.stories[indexPath.row]
        }
        else {
             cell.events = self.events[indexPath.row]
        }

        return cell
    }

        // MARK: - Collection View Delegate
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let currentCell = collectionView.cellForItemAtIndexPath(indexPath) as! CharacterSectionCollectionViewCell

        self.delegate?.delegateForCell(currentCell.imageView, cellTag: self.tag, selectedItemIndex: indexPath.item)
    }

    // MARK: - Collection View footer: UIActivityIndicatorView
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        /*
        let forYouLabel:UILabel = UILabel()
        forYouLabel.text = "test test"
        forYouLabel.font = UIFont.systemFontOfSize(28)
        forYouLabel.sizeToFit()

        return CGSizeMake(300, 100)
 */
        return CGSizeMake(60.0, 30.0)
    }


    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        var returnView: UICollectionReusableView = UICollectionReusableView()


        if (kind == UICollectionElementKindSectionFooter){
            footerReusableView = self.collectionView!.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionFooter, withReuseIdentifier: "FooterView", forIndexPath: indexPath) as? FooterReusableView
//            footerReusableView.activityIndicator.startAnimating()

            returnView = footerReusableView!

            /*
             /* configure footer view using */
             let view = UIView()
             activityIndicator.translatesAutoresizingMaskIntoConstraints = false
             view.addSubview(activityIndicator)
             // Standard Programmatic Layout
             // Autolayout equation: label.left = (view.left * multiplier) + constant
             let constraintToAnimate: NSLayoutConstraint = NSLayoutConstraint(item: activityIndicator, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.CenterY, multiplier: 2, constant: 0)
             view.addConstraint(constraintToAnimate)

             self.activityIndicator.startAnimating()
             returnView.addSubview(view)

             */
        }
        
        return returnView
    }
}

extension CategoryRow : UICollectionViewDelegateFlowLayout {
/*
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let itemsPerRow:CGFloat = 4
        let hardCodedPadding:CGFloat = 5
        let itemWidth = (collectionView.bounds.width / itemsPerRow) - hardCodedPadding
        let itemHeight = collectionView.bounds.height - (2 * hardCodedPadding)
        return CGSize(width: itemWidth, height: itemHeight)
    }
*/
}
