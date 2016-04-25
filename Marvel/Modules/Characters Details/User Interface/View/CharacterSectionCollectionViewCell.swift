//
//  CharacterSectionCollectionViewCell.swift
//  Marvel
//
//  Created by Sameh Mabrouk on 4/22/16.
//  Copyright © 2016 smapps. All rights reserved.
//

import UIKit
import Haneke

/*** Collection View custom cell that represents character section cell like comics cells */
class CharacterSectionCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!

    var comic: Comic? {
        didSet {
            if let characterComic = comic {
                // Setting a remote image
                if let path = characterComic.thumbnail {
                        self.imageView.contentMode = UIViewContentMode.ScaleAspectFill
                        self.imageView.hnk_setImageFromURL(NSURL(string: path.path! + "." + path.thumbExtension!)!)
                }
                // Setting title
                self.titleLabel.text = characterComic.title
            }
        }
    }

    var series: Series? {
        didSet {
            if let characterSeries = series {
                // Setting a remote image
                if let path = characterSeries.thumbnail {

                    self.imageView.hnk_setImageFromURL(NSURL(string: path.path! + "." + path.thumbExtension!)!)
                }
                // Setting title
                self.titleLabel.text = characterSeries.title
            }
        }
    }

    var stories: Stories? {
        didSet {
            if let characterStories = stories {
                // Setting a remote image
                if let path = characterStories.thumbnail {

                    self.imageView.hnk_setImageFromURL(NSURL(string: path.path! + "." + path.thumbExtension!)!)
                }
                // Setting title
                self.titleLabel.text = characterStories.title
            }
        }
    }

    var events: Events? {
        didSet {
            if let characterEvents = events {
                // Setting a remote image
                if let path = characterEvents.thumbnail {

                    self.imageView.hnk_setImageFromURL(NSURL(string: path.path! + "." + path.thumbExtension!)!)
                }

                // Setting title
                self.titleLabel.text = characterEvents.title
            }
        }
    }
}
