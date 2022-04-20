//
//  ListAssemblyTests.swift
//  Lesson6Tests
//
//  Created by Александр Фомин on 20.04.2022.
//  Copyright © 2022 Alex Apriamashvili. All rights reserved.
//

import XCTest
@testable import Lesson6

class ListAssemblyTests: XCTestCase {

    final class ListAssemblyTests: XCTestCase {
        
        func testViewAssembly() {
            let controller = ListAssembly.assemble()
            XCTAssert(controller is ListViewController)
            
            let sut = controller as! ListViewController
            XCTAssertNotNil(sut.output)
        }
        
        func testPresenterAssembly() {
            let presenter = (ListAssembly.assemble() as! ListViewController).output
            XCTAssert(presenter is ListPresenter)
            
            let sut = presenter as! ListPresenter
            
            XCTAssertNotNil(sut.interactor)
            XCTAssertNotNil(sut.router)
            XCTAssertNotNil(sut.view)
        }
        
        func testInteractorAssembly() {
            let presenter = (ListAssembly.assemble() as! ListViewController).output
            let interactor = (presenter as! ListPresenter).interactor
            XCTAssert(interactor is ListInteractor)
            
            let sut = interactor as! ListInteractor
            XCTAssertNotNil(sut.output)
        }
        
        func testRouterAssembly() {
            let presenter = (ListAssembly.assemble() as! ListViewController).output
            let router = (presenter as! ListPresenter).router
            
            XCTAssert(router is ListRouter)
            
            let sut = router as! ListRouter
            XCTAssertNotNil(sut.view)
        }
    }
}
