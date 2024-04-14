//
//  PanelView.swift
//  Doodle
//
//  Created by Pradyut Fogla on 14/04/24.
//

import SwiftUI

struct PanelView: View {
    @Environment(ViewModel.self) private var model
    var body: some View {
        @Bindable var model = model
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onTapGesture {
                model.flowState = FlowStatey.two
            }
        
        Button(action: {Task{
            model.flowState = FlowStatey.two
            print("button working")
        }}, label: {
            Text("Change")
        })
        
    }
}

#Preview {
    PanelView()
}
