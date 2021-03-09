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

    init() {
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
    }

}
