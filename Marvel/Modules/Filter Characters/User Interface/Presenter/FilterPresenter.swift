//
//  FilterPresenter.swift
//  Marvel
//
//  Created by Sameh Mabrouk on 4/25/16.
//  Copyright © 2016 smapps. All rights reserved.
//

import UIKit

class FilterPresenter: NSObject, ListInteractorOutput, FilterModuleInterface, UISearchControllerDelegate {

    var filterInteractor : FilterInteractor?
    var filterWireframe : FilterWireframe?
    var filterModuleDelegate : FilterModuleInterface?
    var userInterface : FilterViewInterface?

    func updateView(limit limit: Int, name: String) {
        filterInteractor?.getCharacters(limit: limit, name: name)
    }

    func foundCharacters(characters: [Character]) {
        if characters.count > 0 {
            userInterface?.showCharacters(characters)
        }
    }
    
    func tableViewCellSelected(selectedCellIndex: Int, characters: [Character]) {
        // Ask wireframe to navigate to MarvelHeroesDetailsTableViewController.
        filterWireframe?.PresentDetailsInterface(selectedCellIndex, characters: characters)
        

    }
}
