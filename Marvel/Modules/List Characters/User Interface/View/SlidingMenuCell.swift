//
//  SlidingMenuCell.swift
//  Marvel
//
//  Created by Sameh Mabrouk on 4/16/16.
//  Copyright © 2016 smapps. All rights reserved.
//

import UIKit
import Haneke
/**
 SlidingMenuCell is a subclass of UICollectionViewCell that is used for displaying rows in a RPSlidingMenuViewController.  It has a textLabel that can be set to show a header title for the cell.  It also has a detailTextLabel where a longer description can follow the textLabel header.  The backgroundImageView allows an image to be set behind it.  This cell has text that fades and shrink as it goes from feature height to normal height
 */
class SlidingMenuCell: UICollectionViewCell {

    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var imageCoverView: UIView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var timeAndRoomLabel: UILabel!
    @IBOutlet private weak var speakerLabel: UILabel!

    var character: Character? {
        didSet {
            if let marvelCharacter = character {

                // Setting a remote image
                if let path = marvelCharacter.thumbnail {

                    imageView.hnk_setImageFromURL(NSURL(string: path.path! + "." + path.thumbExtension!)!)
                }

                // Setting title
                titleLabel.text = marvelCharacter.name
            }
        }
    }

    override func applyLayoutAttributes(layoutAttributes: UICollectionViewLayoutAttributes) {
        super.applyLayoutAttributes(layoutAttributes)

        let featuredHeight = SlidingCellFeatureHeight
        let standardHeight = SlidingCellCollapsedHeight

        let delta = 1 - ((featuredHeight - CGRectGetHeight(frame)) / (featuredHeight - standardHeight))

        let minAlpha: CGFloat = 0.3
        let maxAlpha: CGFloat = 0.75

        imageCoverView.alpha = maxAlpha - (delta * (maxAlpha - minAlpha))

        let scale = max(delta, 0.5)
        titleLabel.transform = CGAffineTransformMakeScale(scale, scale)
    }

}
