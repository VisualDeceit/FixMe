//
//  ListAssembly.swift
//  Lesson6
//
//  Created by Александр Фомин on 20.04.2022.
//  Copyright © 2022 Alex Apriamashvili. All rights reserved.
//

import UIKit

struct ListAssembly {

  static func assemble() -> UIViewController {
    let view = ListViewController()
    let presenter = ListPresenter()
    let interactor = ListInteractor()
    let router = ListRouter()

    view.output = presenter
    interactor.output = presenter
    presenter.view = view
    presenter.router = router
    presenter.interactor = interactor
    router.view = view

    return view
  }
}
