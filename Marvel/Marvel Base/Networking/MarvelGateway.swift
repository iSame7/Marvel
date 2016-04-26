//
//  MarvelGateway.swift
//  Marvel
//
//  Created by Sameh Mabrouk on 4/18/16.
//  Copyright © 2016 smapps. All rights reserved.
//

import UIKit

/**
 This prtocol is made to acheive the Dependency Inversion Principle - the D of SOLID.The classic way to invert a dependency is to extract a protocol. (when you see “protocol,” think “interface.”) We’ll call it the Marvel Gateway.
 To make our API service layer more ignorant about most of the app, it has to implement the marvel gateway protocol. The prtocol act as a contract.
 Thanks to Dependency Inversion, the rest of the app can now be ignorant. It knows about the contract, but not about any class that satisfies that contract.
 Anything that implements the protocol can be plugged in. The Marvel Gateway serves as a Boundary.
 */
protocol MarvelGateway {

    // get all characters.
    func characters(limitMarvelNumberOfResources: Int, completionHandler:(characters:[Character])->Void, failure:(error:ErrorType?)->Void)
    // get characters comics
    func charactersComics(limitMarvelNumberOfResources: Int, charachterId: String, completionHandler: (comics: [Comic]) -> Void, failure: (error: ErrorType?) -> Void)
    // get characters series
    func charactersSeries(limitMarvelNumberOfResources: Int, charachterId: String, completionHandler: (series: [Series]) -> Void, failure: (error: ErrorType?) -> Void)
    // get characters stories
    func charactersStories(limitMarvelNumberOfResources: Int, charachterId: String, completionHandler: (stories: [Stories]) -> Void, failure: (error: ErrorType?) -> Void)
    // get characters events
    func charactersEvents(limitMarvelNumberOfResources: Int, charachterId: String, completionHandler: (events: [Events]) -> Void, failure: (error: ErrorType?) -> Void)
    // filter characters by name
    func filterCharacters(limitMarvelNumberOfResources: Int, name: String, completionHandler: (characters: [Character]) -> Void, failure: (error: ErrorType?) -> Void)

}
