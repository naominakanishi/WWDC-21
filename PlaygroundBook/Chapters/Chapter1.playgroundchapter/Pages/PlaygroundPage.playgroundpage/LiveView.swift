//
//  See LICENSE folder for this template’s licensing information.
//
//  Abstract:
//  Instantiates a live view and passes it to the PlaygroundSupport framework.
//

import UIKit
import BookCore
import PlaygroundSupport

// Instantiate a new instance of the live view from BookCore and pass it to PlaygroundSupport.
PlaygroundPage.current.liveView = instantiateLiveView()

//let sceneView = SKView(frame: CGRect(x:0 , y:0, width: 1366, height: 1024))
//if let scene = LiveView1(fileNamed: "LiveView1") {
//    // Set the scale mode
//    scene.scaleMode = .aspectFit
//
//    // Present the scene
//    sceneView.presentScene(scene)
//}
//
//PlaygroundSupport.PlaygroundPage.current.liveView = sceneView
