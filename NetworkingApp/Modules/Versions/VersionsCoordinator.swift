//
//  VersionsCoordinator.swift
//  NetworkingApp
//
//  Created by Justin Peckner on 2/17/21.
//  Copyright © 2021 Aspiration Partners. All rights reserved.
//

import UIKit

class VersionsCoordinator {

    enum State {
        case idle
        case loading
        case success
        case failure
    }

    private let versionsService = XcodeVersionsService()
    private let viewController = VersionsViewController()
    
    private var state: State = .idle {
        didSet {
            // TODO: fill this in as needed during interview
        }
    }

    var rootViewController: UIViewController {
        viewController
    }

    func start() {
        // TODO: fill this in as needed during interview, including any desired method params
    }

}
