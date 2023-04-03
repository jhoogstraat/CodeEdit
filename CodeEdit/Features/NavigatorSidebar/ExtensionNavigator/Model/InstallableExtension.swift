//
//  InstallableExtension.swift
//  CodeEdit
//
//  Created by Josh on 02.04.23.
//

import SwiftUI

class InstallableExtension: Identifiable, ObservableObject {
    let id = UUID()
    let logo: Image
    let name: String
    let description: String
    @Published var installing: Bool
    
    init(logo: Image, name: String, description: String, installing: Bool) {
        self.logo = logo
        self.name = name
        self.description = description
        self.installing = installing
    }
}

struct InstallabeExtensionCategory: Identifiable {
    let id = UUID()
    let title: String
    let installabes: [InstallableExtension]
}
