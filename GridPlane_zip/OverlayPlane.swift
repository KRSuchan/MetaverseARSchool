//
//  OverlayPlane.swift
//  GridPlane
//
//  Created by snlcom on 2023/05/25.
//

import Foundation
import SceneKit
import ARKit

class OverlayPlane : SCNNode {
    var anchor: ARPlaneAnchor
    var planeGeometry: SCNPlane!
    
    init(anchor: ARPlaneAnchor){
        self.anchor = anchor
        super.init()
    }
    
    func update(anchor: ARPlaneAnchor){
        
        self.planeGeometry.width = CGFloat(anchor.extent.x);
        self.planeGeometry.height = CGFloat(anchor.extent.z);
        
        self.position = SCNVector3Make(anchor.center.x, 0, anchor.center.z)
        let planeNode = self.childNodes.first
        
    }
    
    private func setup(){
        
    }
    
    required init?(coder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
}
