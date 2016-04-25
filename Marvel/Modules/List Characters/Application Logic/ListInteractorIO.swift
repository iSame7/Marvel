//
//  ListInteractorIO.swift
//  Marvel
//
//  Created by Sameh Mabrouk on 4/20/16.
//  Copyright © 2016 smapps. All rights reserved.
//

import UIKit

protocol ListInteractorInput {

    /**
     * Add here your methods for communication PRESENTER -> INTERACTOR
     */
    func getCharacters(limit limit: Int)
}

protocol ListInteractorOutput {

    /**
    * Add here your methods for communication INTERACTOR -> PRESENTER
    */
    func foundCharacters(characters: [Character])
}