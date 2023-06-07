//
//  ViewController.swift
//  3DObject
//
//  Created by snlcom on 2023/05/31.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        
        // Create a new scene
        let scene = SCNScene()
        
        // Set the scene to the view
        sceneView.scene = scene
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        if anchor is ARObjectAnchor {
            
            print("well done")
            let informationText = SCNText(string: "Well Done!!", extrusionDepth: 0.6)
            informationText.firstMaterial?.diffuse.contents = UIColor.red
            let informationTextNode = SCNNode(geometry: informationText)
            informationTextNode.scale = SCNVector3(x: 0.002, y: 0.002, z: 0.002)
            node.addChildNode(informationTextNode)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let make3DObject = ARReferenceObject.referenceObjects(inGroupNamed: "AR Resources", bundle: nil) else {
            // guard error catch Script
            fatalError("디버그 : 오브젝트에 문제 있음")
        }
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        configuration.detectionObjects = make3DObject

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
}
