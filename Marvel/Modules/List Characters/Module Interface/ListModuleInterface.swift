//
//  ListModuleInterface.swift
//  Marvel
//
//  Created by Sameh Mabrouk on 4/20/16.
//  Copyright © 2016 smapps. All rights reserved.
//

import UIKit

protocol ListModuleInterface {

    /**
     * Add here your methods for communication PRESENTER -> VIEW
     */
    func updateView(limit limit: Int)

    func searchCharacters()

    func openDetailsView(selectedCellIndex: Int, characters: [Character])
}
