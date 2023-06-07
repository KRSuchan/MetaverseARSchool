import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    let registerColor = [UIColor.red, UIColor.blue, UIColor.green, UIColor.systemPink]
    
    private var watchNode: SCNNode!
    
    private var offsetX : CGFloat = 20
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Auto Light Effect
        sceneView.autoenablesDefaultLighting = true;
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        // Create a new scene
        let scene = SCNScene()
        
        // Set the scene to the view
        sceneView.scene = scene
        
        addColorWatch()
    }
    
    func addColorWatch() {
        // regist band color using Loop function
        for colors in self.registerColor {
            let watchView = ChangeColors(color: colors){
                color in
                guard let bandNode = self.watchNode.childNode(withName: "band", recursively: true) else{
                    return
                }
                bandNode.geometry?.firstMaterial?.diffuse.contents = color
            }
            self.view.addSubview(watchView)
            configureConstraints(for: watchView)
        }
    }

    // configure function layout for the other devices
    func configureConstraints(for watchView: UIView){
        
        watchView.translatesAutoresizingMaskIntoConstraints = false
        
        // width
        watchView.widthAnchor.constraint(equalToConstant: watchView.frame.size.width).isActive = true;
        
        // height
        watchView.heightAnchor.constraint(equalToConstant: watchView.frame.size.height).isActive = true;
        
        // bottom
        watchView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -25).isActive = true;
        
        // left
        watchView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: offsetX).isActive = true;
        
        // button size division
        offsetX += view.frame.width / 4
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        if let anchor = anchor as? ARImageAnchor{
            let refImg = anchor.referenceImage
            addWatch(to: node, referenceImage: refImg)
        }
    }
    
    // private 함수 - watch model 불러오기 및 node 구성
    
    private func addWatch(to node: SCNNode, referenceImage: ARReferenceImage){
        // 데이터 큐에 관한 비동기, 동기 설정
        DispatchQueue.global().async {
            let watchSCN = SCNScene(named: "watch-model.dae")! // ! : 무조건 실행
            self.watchNode = watchSCN.rootNode.childNode(withName: "watch", recursively: true)!
            
            node.addChildNode(self.watchNode)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARImageTrackingConfiguration()
        
        guard let refImg = ARReferenceImage.referenceImages(inGroupNamed: "AR Resources", bundle: nil) else {
            fatalError("There is no detected img in refImg")
        }
        
        configuration.trackingImages = refImg

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
