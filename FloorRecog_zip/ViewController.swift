import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    private let detectionLabel: UILabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
//        self.sceneView = ARSCNView(frame: self.view.frame)
        
        self.detectionLabel.frame = CGRect(x: 0, y: 0, width: self.sceneView.frame.size.width, height: 40)
        self.detectionLabel.center = self.sceneView.center
        self.detectionLabel.textAlignment = .center
        self.detectionLabel.textColor = UIColor.white
        self.detectionLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        self.detectionLabel.alpha = 0
        
        self.sceneView.addSubview(self.detectionLabel) // label 등록
//        self.sceneView = ARSCNView(frame: self.view.frame)
        
        self.sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints, ARSCNDebugOptions.showWorldOrigin]
        

    }
    
    /*
    private func registerGestureRecognizer()
    {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapDisplay))
        self.sceneView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func tapDisplay(recognizer:UITapGestureRecognizer)
    {
        // if tap, then action
        let sceneView = recognizer.view as! ARSCNView
        let tappedLocation = recognizer.location(in: sceneView)
        
        let hitResult = sceneView.hitTest(tappedLocation, types: .existingPlaneUsingExtent)
        
        if !hitResult.isEmpty {
            guard let hitResult = hitResult.first else{return}
        }
    }
    
    private func addBox(htiResult : ARHitTestResult)
    {
        let boxGeometry = SCNBox(width: 0.2, height: 0.2, length: 0.2, chamferRadius: 0)
        let material = SCNMaterial()
        material.diffuse.contents = UIColor.red
        boxGeometry.materials = [material]
        
        let boxNode = SCNNode(geometry: boxGeometry)
        boxNode.position = SCNVector3(x: <#T##Float#>, y: <#T##Float#>, z: <#T##Float#>)
        
        self.sceneView.scene.rootNode.addChildNode(boxNode)
        
    }
    */
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = .horizontal
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
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor:ARAnchor) {
    // label에 text 값 주기
    DispatchQueue.main.async {
        self.detectionLabel.text = "Plane이 감지되었습니다."
        
        UIView.animate(withDuration: 2.5, animations: {
            self.detectionLabel.alpha = 1.0
        })  {(completion: Bool) in
            self.detectionLabel.alpha = 0.0
            }
        }
    }
}


