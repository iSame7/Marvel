//
//  FilterModuleInterface.swift
//  Marvel
//
//  Created by Sameh Mabrouk on 4/25/16.
//  Copyright © 2016 smapps. All rights reserved.
//

import UIKit

protocol FilterModuleInterface {

    /**
     * Add here your methods for communication PRESENTER -> VIEW
     */

    func tableViewCellSelected(selectedCellIndex: Int, characters: [Character])

    func updateView(limit limit: Int, name: String)
}
