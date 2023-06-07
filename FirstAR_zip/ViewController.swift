//
//  ViewController.swift
//  FirstAR
//
//  Created by snlcom on 2023/05/17.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        Set the view's delegate
        sceneView.delegate = self
        
//         Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
//         Create a new scene
        let scene = SCNScene()
        
//         Set the scene to the view
        sceneView.scene = scene
        
        // MARK: Box
//        let box = SCNBox(width: 0.3, height: 0.3, length: 0.3, chamferRadius: 0)
//
//        let material = SCNMaterial()
//        material.diffuse.contents = UIColor.yellow
//
//        box.materials = [material]
//
//        let boxNode = SCNNode(geometry: box)
//        boxNode.position = SCNVector3(x: 0.0, y: 0.0, z: -0.5)
//
//        self.sceneView.scene.rootNode.addChildNode(boxNode)
        
        // MARK: TEXT
//        let text = SCNText(string: "HelloWorld!", extrusionDepth: 1.0)
//        text.firstMaterial?.diffuse.contents = UIColor.blue
//
//        let textNode = SCNNode(geometry: text)
//        textNode.position = SCNVector3(x: 0.0, y: 0.0, z: -5.0)
//        textNode.scale = SCNVector3(x: 0.03, y: 0.03, z: 0.03)
//
//        self.sceneView.scene.rootNode.addChildNode(textNode)
        
        // MARK: Multi Scene
        
        
        
        // MARK: define BOX
        let box = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0)
        let material = SCNMaterial()
        material.diffuse.contents = UIImage(named: "grass.jpg")
        let boxNode = SCNNode(geometry: box)
        boxNode.geometry?.materials=[material]
        boxNode.position = SCNVector3(x: 0.0, y: 0.0, z: -1.0)
        self.sceneView.scene.rootNode.addChildNode(boxNode)
        
        // MARK: define SPHERE
        let sphere = SCNSphere(radius: 0.3)
        sphere.firstMaterial?.diffuse.contents=UIImage(named: "world.jpg")
        let sphereNode = SCNNode(geometry: sphere)
        sphereNode.position = SCNVector3(x: 0.5, y: 0.5, z: -1.0)
        self.sceneView.scene.rootNode.addChildNode(sphereNode)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

    // MARK: - ARSCNViewDelegate
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
