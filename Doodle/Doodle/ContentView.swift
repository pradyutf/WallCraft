//
//  ContentView.swift
//  Doodle
//
//  Created by Pradyut Fogla on 26/02/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {

   
    @Environment(ViewModel.self) private var model
    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace
    @Environment(\.openWindow) private var openWindow
    @Environment(\.dismissWindow) private var dismissWindow

    var body: some View {
        @Bindable var model = model
        VStack(alignment: .leading, content: {
            Text("Welcome ")
                .font(.extraLargeTitle2)
                .foregroundColor(Color.yellow)
            
            Button(action: {Task{
                await openImmersiveSpace(id: "ImmersiveSpace")
            }}, label: {
                Text("Place Panel")
            })
            
            
            Toggle(model.isPanel ? "Hide Panels" : "Show Panels", isOn: $model.isPanel)
                .onChange(of: model.isPanel) { _, isShowing in
                    if isShowing {
                        openWindow(id: "PanelView")
                    }
                    else
                    {
                        dismissWindow(id: "PanelView")
                    }
                }
                .toggleStyle(.button)
                
        })
        .padding(50)
        .glassBackgroundEffect()
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
