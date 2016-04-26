//
//  FilterTableViewCell.swift
//  Marvel
//
//  Created by Sameh Mabrouk on 4/25/16.
//  Copyright © 2016 smapps. All rights reserved.
//

import UIKit

class FilterTableViewCell: UITableViewCell {

    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!

    var character: Character? {
        didSet {
            if let marvelcharacter = character {
                // Setting labels
                if let name = marvelcharacter.name {
                    self.titleLabel.text = name
                }

                // Setting a remote image
                if let path = marvelcharacter.thumbnail {
//                    self.characterImageView.contentMode = UIViewContentMode.ScaleAspectFill
                    self.characterImageView.hnk_setImageFromURL(NSURL(string: path.path! + "." + path.thumbExtension!)!)
                }

            }
        }
    }

}
