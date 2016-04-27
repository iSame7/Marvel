//
//  ListPresenter.swift
//  Marvel
//
//  Created by Sameh Mabrouk on 4/20/16.
//  Copyright © 2016 smapps. All rights reserved.
//

import UIKit

/* 
 contains view logic for preparing content for display (as received from the Interactor) and for reacting to user inputs (by requesting new data from the Interactor).
 */
class ListPresenter: NSObject, ListInteractorOutput, ListModuleInterface {

    var listInteractor : ListInteractorInput?
    var listWireframe : ListWireframe?
    var userInterface : ListViewInterface?

    func updateView(limit limit: Int) {
        listInteractor?.getCharacters(limit: limit)
    }

    func searchCharacters() {
        listWireframe?.presentFilterInterface()
    }

    func foundCharacters(characters: [Character]) {
        if characters.count > 0 {
            userInterface?.showCharacters(characters)
        }
    }

    func openDetailsView(selectedCellIndex: Int, characters: [Character]) {
        listWireframe?.PresentDetailsInterface(selectedCellIndex, characters: characters)
    }
}
