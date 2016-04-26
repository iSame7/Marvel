//
//  AppDependencies.swift
//  Marvel
//
//  Created by Sameh Mabrouk on 4/25/16.
//  Copyright © 2016 smapps. All rights reserved.
//

import UIKit

class AppDependencies {

    var listWireframe = ListWireframe()

    init() {
        configureDependencies()
    }

    func installRootViewControllerIntoWindow(window: UIWindow) {
        listWireframe.presentListInterfaceFromWindow(window)
    }

    func configureDependencies() {
        let rootWireframe = RootWireframe()

        let listPresenter = ListPresenter()
        let listInteractor = ListInteractor(marvelgateway: MarvelFactory())

        let filterWireframe = FilterWireframe()
        let filterInteractor = FilterInteractor(marvelgateway: MarvelFactory())
        let filterPresenter = FilterPresenter()

        let detailsWireframe = DetailsWireframe()

        listInteractor.output = listPresenter

        listPresenter.listInteractor = listInteractor
        listPresenter.listWireframe = listWireframe

        listWireframe.filterWireframe = filterWireframe
        listWireframe.listPresenter = listPresenter
        listWireframe.rootWireframe = rootWireframe

        filterInteractor.output = filterPresenter
        
        filterWireframe.filterPresenter = filterPresenter
        filterWireframe.detailsWireframe = detailsWireframe

        filterPresenter.filterWireframe = filterWireframe
        filterPresenter.filterInteractor = filterInteractor
//        filterPresenter.filterModuleDelegate = listPresenter


    }


}
