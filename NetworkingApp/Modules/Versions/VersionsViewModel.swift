//
//  VersionsViewModel.swift
//  NetworkingApp
//
//  Created by Christian Hipolito on 09/03/21.
//  Copyright © 2021 Aspiration Partners. All rights reserved.
//

import Foundation

final class VersionsViewModel {
    var xcVersions: [XcodeVersion]?
    var showSpinner: Bool = true
    var showErrorLabel: Bool {
        get {
            if xcVersions != nil && xcVersions!.isEmpty {
                return true
            }
            
            return false
        }
    }
    
    var errorMessage: String {
        return "Oops! Something went wrong downloading xcode versions"
    }
    
    var numberOfCells: Int {
        get {
            return xcVersions?.count ?? 0
        }
    }
    
    func getVersionNumberAt(index: Int) -> String {
        let xcVersion = xcVersions![index]
        
        return "Version: " + xcVersion.version.number + ". Build: " + xcVersion.version.build
    }
    
    func getFormattedDateAt(index: Int) -> String {
        let xcVersion = xcVersions![index]
        
        return "\(xcVersion.date.month)/\(xcVersion.date.day)/\(xcVersion.date.year)"
    }
}
