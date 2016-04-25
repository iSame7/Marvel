//
//  CharacterDetailsTopCellTableViewCell.swift
//  Marvel
//
//  Created by Sameh Mabrouk on 4/22/16.
//  Copyright © 2016 smapps. All rights reserved.
//

import UIKit

class CharacterDetailsTopCellTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    var character: Character? {
        didSet {
            if let marvelcharacter = character {
                // Setting labels
                if let name = marvelcharacter.name {
                    self.nameLabel.text = name
                }
                if let description = marvelcharacter.description {
                    self.descriptionLabel.text = description
                }

            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
