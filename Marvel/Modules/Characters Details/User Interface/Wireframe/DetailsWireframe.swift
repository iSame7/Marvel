//
//  DetailsWireframe.swift
//  Marvel
//
//  Created by Sameh Mabrouk on 4/25/16.
//  Copyright © 2016 smapps. All rights reserved.
//

import UIKit

/***
 Routes from one screen to another are defined in the wireframes created by an interaction designer. In VIPER, the responsibility for Routing is shared between two objects: the Presenter, and the wireframe. A wireframe object owns the UIWindow, UINavigationController, UIViewController, etc. It is responsible for creating a View/ViewController and installing it in the window.
 */

let marvelHeroesDetailsTableViewControllerIdentifier = "MarvelHeroesDetails"

class DetailsWireframe: NSObject {

    var detailsPresenter : DetailsPresenter?

    func navigateToDetailsInterfaceFromViewController(viewController: UIViewController, selectedCellIndex: Int, characters: [Character]) {

        let newViewController = marvelHeroesDetailsTableViewController()
        newViewController.eventHandler = detailsPresenter
        detailsPresenter?.userInterface = newViewController
        newViewController.charachterId = String(characters[selectedCellIndex].id)
        newViewController.selectedCharacterImagePath = characters[selectedCellIndex].thumbnail.path! + "." + characters[selectedCellIndex].thumbnail.thumbExtension!
        newViewController.selectedCharacterUrls = characters[selectedCellIndex].urls
        newViewController.selectedCharacterObj = characters[selectedCellIndex]

        viewController.navigationController?.pushViewController(newViewController, animated: true)
    }

    func marvelHeroesDetailsTableViewController() -> MarvelHeroesDetailsTableViewController {
        let storyboard = mainStoryboard()
        let addViewController: MarvelHeroesDetailsTableViewController = storyboard.instantiateViewControllerWithIdentifier(marvelHeroesDetailsTableViewControllerIdentifier) as! MarvelHeroesDetailsTableViewController
        return addViewController
    }

    func mainStoryboard() -> UIStoryboard {
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        return storyboard
    }
}
