//
//  ExtensionNavigatorView.swift
//  CodeEdit
//
//  Created by Joshua Hoogstraat on 02.04.23.
//

import SwiftUI

struct ExtensionNavigatorView: View {

    @EnvironmentObject
    private var workspace: WorkspaceDocument

    @State
    private var selectedSection = 1

    @State
    private var searchText = ""

    @State private var selectedExtension: UUID?

    private var categories = [
        InstallabeExtensionCategory(
            title: "Recommended",
            installabes: [
            InstallableExtension(
                logo: .github,
                name: "ESLint",
                description: "Find and fix problems in your JavaScript code.",
                installing: true
            ),
            InstallableExtension(
                logo: Image("docker"),
                name: "ESLint",
                description: "Find and fix problems in your JavaScript code.",
                installing: false
                        ),
            InstallableExtension(
                logo: Image("docker"),
                 name: "ESLint",
                 description: "Find and fix problems in your JavaScript code.",
                 installing: false
            ),
            InstallableExtension(
                logo: Image("docker"),
                name: "ESLint",
                description: "Find and fix problems in your JavaScript code.",
                installing: false
            ),
        ]
        ),
        InstallabeExtensionCategory(
            title: "Most downloaded",
            installabes: [
                InstallableExtension(
                    logo: .github,
                    name: "ESLint",
                    description: "Find and fix problems in your JavaScript code.",
                    installing: true
                ),
                InstallableExtension(
                    logo: .github,
                    name: "ESLint",
                    description: "Find and fix problems in your JavaScript code.",
                    installing: true
                ),
                InstallableExtension(
                    logo: .github,
                    name: "ESLint",
                    description: "Find and fix problems in your JavaScript code.",
                    installing: true
                ),
                InstallableExtension(
                    logo: .github,
                    name: "ESLint",
                    description: "Find and fix problems in your JavaScript code.",
                    installing: true
                ),
                InstallableExtension(
                    logo: .github,
                    name: "ESLint",
                    description: "Find and fix problems in your JavaScript code.",
                    installing: true
                ),
                InstallableExtension(
                    logo: .github,
                    name: "ESLint",
                    description: "Find and fix problems in your JavaScript code.",
                    installing: true
                ),
                InstallableExtension(
                    logo: .github,
                    name: "ESLint",
                    description: "Find and fix problems in your JavaScript code.",
                    installing: true
                ),
                InstallableExtension(
                    logo: .github,
                    name: "ESLint",
                    description: "Find and fix problems in your JavaScript code.",
                    installing: true
                ),
                InstallableExtension(
                    logo: .github,
                    name: "ESLint",
                    description: "Find and fix problems in your JavaScript code.",
                    installing: true
                ),
                InstallableExtension(
                    logo: .github,
                    name: "ESLint",
                    description: "Find and fix problems in your JavaScript code.",
                    installing: true
                ),
                InstallableExtension(
                    logo: .github,
                    name: "ESLint",
                    description: "Find and fix problems in your JavaScript code.",
                    installing: true
                ),
                InstallableExtension(
                    logo: .github,
                    name: "ESLint",
                    description: "Find and fix problems in your JavaScript code.",
                    installing: true
                ),
                InstallableExtension(
                    logo: .github,
                    name: "ESLint",
                    description: "Find and fix problems in your JavaScript code.",
                    installing: true
                ),
                InstallableExtension(
                    logo: .github,
                    name: "ESLint",
                    description: "Find and fix problems in your JavaScript code.",
                    installing: true
                ),
                InstallableExtension(
                    logo: .github,
                    name: "ESLint",
                    description: "Find and fix problems in your JavaScript code.",
                    installing: true
                ),
                InstallableExtension(
                    logo: .github,
                    name: "ESLint",
                    description: "Find and fix problems in your JavaScript code.",
                    installing: true
                ),
                InstallableExtension(
                    logo: .github,
                    name: "ESLint",
                    description: "Find and fix problems in your JavaScript code.",
                    installing: true
                ),
                InstallableExtension(
                    logo: .github,
                    name: "ESLint",
                    description: "Find and fix problems in your JavaScript code.",
                    installing: true
                ),
                InstallableExtension(
                    logo: .github,
                    name: "ESLint",
                    description: "Find and fix problems in your JavaScript code.",
                    installing: true
                ),
                InstallableExtension(
                    logo: .github,
                    name: "ESLint",
                    description: "Find and fix problems in your JavaScript code.",
                    installing: true
                ),
                InstallableExtension(
                    logo: .github,
                    name: "ESLint",
                    description: "Find and fix problems in your JavaScript code.",
                    installing: true
                ),
    ]
        )
    ]

    var body: some View {
        VStack {
            SegmentedControl(
                $selectedSection,
                options: ["Installed", "Explore"],
                prominent: true
            )
            .frame(maxWidth: .infinity)
            .frame(height: 27)
            .padding(.horizontal, 8)
            .padding(.bottom, 2)
            .overlay(alignment: .bottom) {
                Divider()
            }

            VStack {
                ExtensionNavigatorSearchBar(title: "Search", text: $searchText)
                    .padding(.horizontal, 8)

                if selectedSection == 0 {
                    List {
                        Text("One")
                        Text("Two")
                        Text("Three")
                    }
                }

                if selectedSection == 1 {
                    List(selection: $selectedExtension) {
                        ForEach(categories) { category in
                            Section(category.title) {
                                ForEach(category.installabes) { installable in
                                    ExtensionNavigatorInstallableExtensionView(installable: installable)
                                        .padding(.vertical, 4)
                                }
                            }
                        }
                    }
                    .listStyle(.sidebar)
                }
            }
        }
    }
}

struct ExtensionNavigatorView_Previews: PreviewProvider {
    static var previews: some View {
        ExtensionNavigatorView()
        ExtensionNavigatorInstallableExtensionView(
            installable: InstallableExtension(
                logo: Image("docker"),
                name: "Docker",
                description: "Helps devs bring ideas to life by conquering the complexity of app development.",
                installing: false
            )
        )
    }
}
