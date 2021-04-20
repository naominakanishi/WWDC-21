//#-hidden-code
//
//  See LICENSE folder for this template’s licensing information.
//
//  Abstract:
//  The Swift file containing the source code edited by the user of this playground book.
//



import PlaygroundSupport
import SpriteKit
import UIKit
import BookCore

let sceneView = SKView(frame: CGRect(x: 0, y: 0, width: 512, height: 768))
if let scene = GameScene(fileNamed: "InitialRoom") {
    scene.scaleMode = .aspectFit
    sceneView.presentScene(scene)
}


PlaygroundPage.current.liveView = sceneView
PlaygroundPage.current.needsIndefiniteExecution = true

//#-end-hidden-code

/*:
 # **Eco Valore**
 * note: This
 
 This Playground Book works only on iPad Air 4th and 5th generation, pro 1st gen
 
 */
