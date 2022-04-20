//
//  ListModule.swift
//  Lesson6
//
//  Created by Александр Фомин on 20.04.2022.
//  Copyright © 2022 Alex Apriamashvili. All rights reserved.
//

import Foundation

// MARK: - View I/O
protocol ListViewInput: AnyObject {
    var output: ListViewOutput? { get set }
    
    func updateList(_ viewModel: [ListViewModel])
}

protocol ListViewOutput {
    func viewIsRead()
    func viewDidSelect(_ row: Int)
}

// MARK: - Interactor I/O
protocol ListInteractorInput {
    var output: ListInteractorOutput? { get set }
    func obtainArtistList()
}

protocol ListInteractorOutput: AnyObject {
    func presentArtistList(_ singers: [Artist])
}

// MARK: - Router I/O

protocol ListRouterInput {
    func openDetailView(for artistId: Int)
}

protocol ListRouterOutput {}

