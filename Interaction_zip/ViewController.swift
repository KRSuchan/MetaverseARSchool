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
        
        let box = SCNBox(width: 0.3, height: 0.3, length: 0.3, chamferRadius: 0)
        
        let material = SCNMaterial()
        // User 와 Interaction 하기 위한 코드라인
        
        material.name = "Color"
        material.diffuse.contents = UIColor.yellow
        
        let boxNode = SCNNode() // SCNNode Initiallizing
        
        boxNode.geometry = box
        boxNode.geometry?.materials = [material]
        boxNode.position = SCNVector3(x: 0, y: 0.2, z: 0.5)
        
        scene.rootNode.addChildNode(boxNode)
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(userTapped))
        
        self.sceneView.addGestureRecognizer(tapGestureRecognizer)
        
        sceneView.scene = scene

    }
    
    // User가 Object를 Tap하였을 때 동작되어야하는 메소드
    @objc func userTapped(recognizer: UITapGestureRecognizer){
        let sceneView = recognizer.view as! SCNView // as! 후의 것을 캐스팅 한다는 의미
        let tapLocation = recognizer.location(in: sceneView)
        let hitResults = sceneView.hitTest(tapLocation, options: [:])
        
        if !hitResults.isEmpty{
            
            let node = hitResults[0].node
            let material = node.geometry?.material(named: "Color")
            
            material?.diffuse.contents = UIColor.random()
            
        }
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

}
