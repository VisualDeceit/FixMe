//
//  ListRouter.swift
//  Lesson6
//
//  Created by Александр Фомин on 20.04.2022.
//  Copyright © 2022 Alex Apriamashvili. All rights reserved.
//

import UIKit

final class ListRouter: ListRouterInput {
    var view: (ListViewInput & UIViewController)?
    
    func openDetailView(for artistId: Int) {
        let viewController = DetailAssembly.assemble(artistId: artistId)
        view?.navigationController?.pushViewController(viewController, animated: true)
    }
}
