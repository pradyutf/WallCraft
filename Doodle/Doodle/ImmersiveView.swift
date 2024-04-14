//
//  ImmersiveView.swift
//  Doodle
//
//  Created by Pradyut Fogla on 26/02/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ImmersiveView: View {
    @Environment(ViewModel.self) private var model
    @State private var planeEntity: Entity?
    
    var body: some View {
        @Bindable var model = model
        RealityView { content in
            if let planeEntity = planeEntity {
                            content.add(planeEntity)
                        }
                    }
                    .onAppear {
                        updatePlaneEntity() // Initial setup
                    }
                    .onChange(of: model.flowState) { _,_ in
                        updatePlaneEntity() 
                        print("updating img")// Update when flowState changes
                    }
        
        
        }
       
    
    private func updatePlaneEntity(){
        let wallAnchor = AnchorEntity(.plane(.vertical, classification: .wall, minimumBounds: SIMD2<Float>(1.0, 0.2)))
        
        let planeMesh = MeshResource.generatePlane(width: 0.70, depth: 4.775, cornerRadius: 0.0)
        
        let img = Image("panel.png")
            .resizable(resizingMode: .tile)
        
        let material: SimpleMaterial
                switch model.flowState {
                case .one:
                    material = ImmersiveView.loadImageMaterial(imageUrl: "panel.png")
                case .two:
                    material = ImmersiveView.loadImageMaterial(imageUrl: "wally.png")
                case .three:
                    material = ImmersiveView.loadImageMaterial(imageUrl: "panel.png")
                }
        
        
        let planeEntity = ModelEntity(mesh: planeMesh, materials: [material])
        
           planeEntity.name = "canvas"
           wallAnchor.addChild(planeEntity)
        
        self.planeEntity = wallAnchor
       }
    

    
    
    static func loadImageMaterial(imageUrl: String) -> SimpleMaterial {
            do {
                let texture = try TextureResource.load(named: imageUrl)
                
            
                
                var material = SimpleMaterial()
                material.baseColor = MaterialColorParameter.texture(texture)
                
                
                return material
            } catch {
                fatalError(String(describing: error))
            }
        }
    }


#Preview {
    ImmersiveView()
        .previewLayout(.sizeThatFits)
}
