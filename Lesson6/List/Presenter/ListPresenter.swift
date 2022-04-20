//
//  ListPresenter.swift
//  Lesson6
//
//  Created by Александр Фомин on 20.04.2022.
//  Copyright © 2022 Alex Apriamashvili. All rights reserved.
//

import Foundation

final class ListPresenter: ListViewOutput, ListInteractorOutput, ListRouterOutput {
    weak var view: ListViewInput?
    var interactor: ListInteractorInput?
    var router: ListRouterInput?
    
    private var singers = [Artist]()
    
    func viewIsRead() {
        interactor?.obtainArtistList()
    }
    
    func presentArtistList(_ singers: [Artist]) {
        self.singers = singers
        let viewModel = singers.map { ListViewModel(name: $0.name) }
        view?.updateList(viewModel)
    }
    
    func viewDidSelect(_ row: Int) {
        router?.openDetailView(for: singers[row].identifier)
    }
}
