//
//  ExtensionNavigatorInstallableExtensionView.swift
//  CodeEdit
//
//  Created by Joshua Hoogstraat on 02.04.23.
//

import SwiftUI

struct ExtensionNavigatorInstallableExtensionView: View {

    @ObservedObject var installable: InstallableExtension

    @EnvironmentObject
    private var workspace: WorkspaceDocument

    var body: some View {
        HStack {
            installable.logo.resizable().frame(width: 35, height: 35)
                .cornerRadius(7)
            VStack(alignment: .leading) {
                Text(installable.name)
                    .font(.system(size: 13))
                Text(installable.description)
                    .font(.system(size: 10))
                    .foregroundColor(.gray)
                    .lineLimit(3)
            }
            Spacer()
            if installable.installing {
                ProgressView()
                    .padding(10)
            } else {
            Button(action: {
                installable.installing.toggle()
                workspace.tabManager.openTab(item: <#T##WorkspaceClient.FileItem#>)
            }, label: {
                Text("GET")
                    .foregroundColor(.accentColor)
                    .font(.system(size: 10, weight: .bold))
                    .padding(15)
            })
            .buttonStyle(.blur)
            .clipShape(Capsule())
            }
        }
    }
}
