//
//  DetailsInteractor.swift
//  Marvel
//
//  Created by Sameh Mabrouk on 4/26/16.
//  Copyright © 2016 smapps. All rights reserved.
//

import UIKit

class DetailsInteractor: NSObject, DetailsInteractorInput {

    // The output of interactor will communicated to presenter through DetailsInteractorOutput protocol.
    var output: DetailsInteractorOutput?

    // Gateway that is our abstraction for all operation of getting data from network.
    var gateway: MarvelGateway?

    init<T:MarvelGateway>(marvelgateway: T) {
        self.gateway = marvelgateway
    }

    func getCharacterComics(characterId charachterId: String) {
        self.gateway!.charactersComics(0, charachterId: charachterId, completionHandler: { (comics) in
            self.output?.foundCharactersComics(comics)
        }) { (error) in

        }
    }

    func getCharacterSeries(characterId characterId: String) {
        self.gateway!.charactersSeries(0, charachterId: characterId, completionHandler: { (series) in
            self.output?.foundCharactersSeries(series)
        }) { (error) in

        }
    }

    func getCharacterStories(characterId characterId: String) {
        self.gateway!.charactersStories(0, charachterId: characterId, completionHandler: { (stories) in
            self.output?.foundCharactersStories(stories)
        }) { (error) in

        }
    }

    func getCharacterEvents(characterId characterId: String) {
        self.gateway!.charactersEvents(0, charachterId: characterId, completionHandler: { (events) in
            self.output?.foundCharactersEvents(events)
        }) { (error) in

        }
    }

}
