//
//  DetailsPresenter.swift
//  Marvel
//
//  Created by Sameh Mabrouk on 4/26/16.
//  Copyright © 2016 smapps. All rights reserved.
//

import UIKit
import ImageViewer

class DetailsPresenter: NSObject, DetailsInteractorOutput, DetailsModuleInterface {

    var detailsInteractor : DetailsInteractorInput?
    var detialsWireframe : DetailsWireframe?
    var userInterface : DetailsViewInterface?

    func updateView(limit limit: Int, characterId: String) {
        detailsInteractor?.getCharacterComics(characterId: characterId)
    }

    func foundCharactersComics(comics: [Comic]) {
        if comics.count > 0 {
            userInterface?.showCharacterComics(comics)
        }
    }

    func updateViewWithCharacterSeries(limit limit: Int, characterId: String) {
        detailsInteractor?.getCharacterSeries(characterId: characterId)
    }

    func foundCharactersSeries(series: [Series]) {
        userInterface?.showCharacterSeries(series)
    }

    func updateViewWithCharacterStories(limit limit: Int, characterId: String) {
        detailsInteractor?.getCharacterStories(characterId: characterId)
    }

    func foundCharactersStories(stories: [Stories]) {
        userInterface?.showCharacterStories(stories)
    }

    func updateViewWithCharacterEvents(limit limit: Int, characterId: String) {
        detailsInteractor?.getCharacterEvents(characterId: characterId)
    }

    func foundCharactersEvents(events: [Events]) {
        userInterface?.showCharacterEvents(events)
    }

    func openImageViewer(galleryViewController: GalleryViewController) {
        detialsWireframe?.presentImageViewerInterfaceFromViewController(galleryViewController)
    }
}
