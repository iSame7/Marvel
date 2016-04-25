//
//  APIManager.swift
//  Marvel
//
//  Created by Sameh Mabrouk on 4/18/16.
//  Copyright © 2016 smapps. All rights reserved.
//

import UIKit

class APIManager: NSObject, MarvelGateway {

    func characters(limitMarvelNumberOfResources: Int, completionHandler: (characters: [Character]) -> Void, failure: (error: ErrorType?) -> Void) {

    }
    func charactersComics(limitMarvelNumberOfResources: Int, charachterId: String, completionHandler: (comics: [Comic]) -> Void, failure: (error: ErrorType?) -> Void) {

    }
    func charactersSeries(limitMarvelNumberOfResources: Int, charachterId: String, completionHandler: (series: [Series]) -> Void, failure: (error: ErrorType?) -> Void) {
        
    }
    func charactersEvents(limitMarvelNumberOfResources: Int, charachterId: String, completionHandler: (events: [Events]) -> Void, failure: (error: ErrorType?) -> Void) {

    }
    func charactersStories(limitMarvelNumberOfResources: Int, charachterId: String, completionHandler: (stories: [Stories]) -> Void, failure: (error: ErrorType?) -> Void) {

    }
}
