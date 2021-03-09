//
//  VersionsView.swift
//  NetworkingApp
//
//  Created by Justin Peckner on 2/17/21.
//  Copyright © 2021 Aspiration Partners. All rights reserved.
//

import UIKit

class VersionsView: UIView {

    private let spinner = UIActivityIndicatorView(style: .medium)
    private let tableView = UITableView()
    private let textLabel = UILabel()
    private let viewModel: VersionsViewModel
    
    init(viewModel: VersionsViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)

        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        setupTable()
        setupSpinner()
        setupTextLabel()
        setupStyling()
    }

    private func setupTable() {
        addSubviewAndEdgeConstraints(tableView)
        tableView.delegate = self
        tableView.dataSource = self
    }

    private func setupSpinner() {
        spinner.translatesAutoresizingMaskIntoConstraints = false
        addSubview(spinner)
        addConstraints([
            spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }

    private func setupTextLabel() {
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(textLabel)
        addConstraints([
            textLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            textLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }

    private func setupStyling() {
        backgroundColor = .white
        spinner.backgroundColor = .clear
        tableView.backgroundColor = .clear
        textLabel.backgroundColor = .clear
    }

}

extension VersionsView {

    func render() {
        // TODO: fill this in as needed during interview, including any desired method params
        if viewModel.showSpinner {
            spinner.startAnimating()
            tableView.isHidden = true
        }
        else {
            spinner.stopAnimating()
            tableView.isHidden = false
        }
        
        guard !viewModel.showErrorLabel else {
            tableView.isHidden = true
            textLabel.text = viewModel.errorMessage
            
            return
        }
        
        tableView.reloadData()
    }

}

extension VersionsView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfCells
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "versionTableCell")
        
        cell.textLabel?.text = viewModel.getVersionNumberAt(index: indexPath.row)
        cell.detailTextLabel?.text = viewModel.getFormattedDateAt(index: indexPath.row)
        
        return cell
    }

}
