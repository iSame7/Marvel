//
//  ListWireframe.swift
//  Marvel
//
//  Created by Sameh Mabrouk on 4/25/16.
//  Copyright © 2016 smapps. All rights reserved.
//

import UIKit

/***
 Routes from one screen to another are defined in the wireframes created by an interaction designer. In VIPER, the responsibility for Routing is shared between two objects: the Presenter, and the wireframe. A wireframe object owns the UIWindow, UINavigationController, UIViewController, etc. It is responsible for creating a View/ViewController and installing it in the window.
 */

let ListViewControllerIdentifier = "ListViewController"

class ListWireframe: NSObject {
    var listPresenter : ListPresenter?
    var rootWireframe : RootWireframe?
    var listViewController : ListCharactersViewController?

    func presentListInterfaceFromWindow(window: UIWindow) {
        let viewController = listViewControllerFromStoryboard()
        viewController.eventHandler = listPresenter
        listViewController = viewController
        listPresenter!.userInterface = viewController
        rootWireframe?.showRootViewController(viewController, inWindow: window)
    }

    func listViewControllerFromStoryboard() -> ListCharactersViewController {
        let storyboard = mainStoryboard()
        let viewController = storyboard.instantiateViewControllerWithIdentifier(ListViewControllerIdentifier) as! ListCharactersViewController
        return viewController
    }

    func mainStoryboard() -> UIStoryboard {
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        return storyboard
    }
}
