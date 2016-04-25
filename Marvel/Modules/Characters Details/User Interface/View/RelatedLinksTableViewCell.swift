//
//  RelatedLinksTableViewCell.swift
//  Marvel
//
//  Created by Sameh Mabrouk on 4/22/16.
//  Copyright © 2016 smapps. All rights reserved.
//

import UIKit

class RelatedLinksTableViewCell: UITableViewCell {

    @IBOutlet private weak var titleLabel: UILabel!

    var url: Url? {
        didSet {
            if let marvelCharacterUrl = url {
                self.titleLabel.text = marvelCharacterUrl.type.uppercaseFirst
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
