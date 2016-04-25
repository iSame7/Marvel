//
//  RootWireframe.swift
//  Marvel
//
//  Created by Sameh Mabrouk on 4/25/16.
//  Copyright © 2016 smapps. All rights reserved.
//

import UIKit

/** Common Routing between Viper modules */
class RootWireframe: NSObject {
    func showRootViewController(viewController: UIViewController, inWindow: UIWindow) {
        let navigationController = navigationControllerFromWindow(inWindow)
        navigationController.viewControllers = [viewController]
    }

    func navigationControllerFromWindow(window: UIWindow) -> UINavigationController {
        let navigationController = window.rootViewController as! UINavigationController
        return navigationController
    }
}
