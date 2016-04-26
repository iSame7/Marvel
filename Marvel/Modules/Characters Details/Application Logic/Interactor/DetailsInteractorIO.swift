//
//  DetailsInteractorIO.swift
//  Marvel
//
//  Created by Sameh Mabrouk on 4/26/16.
//  Copyright © 2016 smapps. All rights reserved.
//

import UIKit

protocol DetailsInteractorInput {

    /**
     * Add here your methods for communication PRESENTER -> INTERACTOR
     */
    func getCharacterComics(characterId charachterId: String)
    func getCharacterSeries(characterId characterId: String)
    func getCharacterStories(characterId characterId: String)
    func getCharacterEvents(characterId characterId: String)
}

protocol DetailsInteractorOutput {

    /**
     * Add here your methods for communication INTERACTOR -> PRESENTER
     */
    func foundCharactersComics(comics: [Comic])
    func foundCharactersSeries(series: [Series])
    func foundCharactersStories(stories: [Stories])
    func foundCharactersEvents(events: [Events])
}