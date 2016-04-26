//
//  FilterInteractorIO.swift
//  Marvel
//
//  Created by Sameh Mabrouk on 4/26/16.
//  Copyright © 2016 smapps. All rights reserved.
//

import UIKit

protocol FilterInteractorInput {

    /**
     * Add here your methods for communication PRESENTER -> INTERACTOR
     */
    func getCharacters(limit limit: Int, name: String)
}

protocol FilterInteractorOutput {

    /**
     * Add here your methods for communication INTERACTOR -> PRESENTER
     */
    func foundCharacters(characters: [Character])
}