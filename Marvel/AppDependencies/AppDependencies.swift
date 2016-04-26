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

    let marvelFactory = MarvelFactory()

    init() {
        configureDependencies()
    }

    func installRootViewControllerIntoWindow(window: UIWindow) {
        listWireframe.presentListInterfaceFromWindow(window)
    }

    func configureDependencies() {
        let rootWireframe = RootWireframe()

        let listPresenter = ListPresenter()
        let listInteractor = ListInteractor(marvelgateway: marvelFactory)

        let filterWireframe = FilterWireframe()
        let filterInteractor = FilterInteractor(marvelgateway: marvelFactory)
        let filterPresenter = FilterPresenter()

        let detailsWireframe = DetailsWireframe()
        let detailsInteractor = DetailsInteractor(marvelgateway: marvelFactory)
        let detailsPresenter = DetailsPresenter()

        /* List Module configurations */

        listInteractor.output = listPresenter

        listPresenter.listInteractor = listInteractor
        listPresenter.listWireframe = listWireframe

        listWireframe.filterWireframe = filterWireframe
        listWireframe.listPresenter = listPresenter
        listWireframe.rootWireframe = rootWireframe
        listWireframe.detailsWireframe = detailsWireframe

        /* Filter Module configurations */

        filterInteractor.output = filterPresenter
        
        filterWireframe.filterPresenter = filterPresenter
        filterWireframe.detailsWireframe = detailsWireframe

        filterPresenter.filterWireframe = filterWireframe
        filterPresenter.filterInteractor = filterInteractor

        /* Details Module configurations */

        detailsInteractor.output = detailsPresenter

        detailsWireframe.detailsPresenter = detailsPresenter

        detailsPresenter.detailsInteractor = detailsInteractor
        detailsPresenter.detialsWireframe = detailsWireframe
        



    }


}
