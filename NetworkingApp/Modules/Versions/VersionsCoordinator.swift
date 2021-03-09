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
    private let viewController: VersionsViewController
    private let viewModel: VersionsViewModel
    
    init() {
        viewModel = VersionsViewModel()
        viewController = VersionsViewController(viewModel: viewModel)
    }
    
    private var state: State = .idle {
        didSet {
            // TODO: fill this in as needed during interview
            viewController.render()
        }
    }

    var rootViewController: UIViewController {
        viewController
    }

    func start() {
        // TODO: fill this in as needed during interview, including any desired method params
        state = .loading
        viewModel.xcVersions = nil
        viewModel.showSpinner = true
        
        versionsService.fetchVersions {[weak self] (xcVersions) in
            self?.viewModel.xcVersions = xcVersions
            self?.viewModel.showSpinner = false
            
            guard !xcVersions.isEmpty else {
                self?.state = .failure
                
                return
            }
            
            self?.state = .success
        }
    }

}
