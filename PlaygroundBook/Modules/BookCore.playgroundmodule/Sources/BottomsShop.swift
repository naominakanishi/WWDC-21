import SpriteKit

public class BottomsShop: SKScene {

    var selectedBottom: SKSpriteNode?
    lazy var crepeTrousers = childNode(withName: "capSleeveShirt") as! SKSpriteNode
    lazy var skinnyJeans = childNode(withName: "cottonTshirt") as! SKSpriteNode
    lazy var tailorPants = childNode(withName:"knitPullover") as! SKSpriteNode
    lazy var nextButton = childNode(withName:"nextButton") as! SKSpriteNode
    
    
    public override func didMove(to view: SKView){
        let fadeInAction = SKAction.fadeIn(withDuration: 0.5)
        crepeTrousers.run(fadeInAction)
        skinnyJeans.run(fadeInAction)
        tailorPants.run(fadeInAction)
    }

    //text.text = "frase aqui"
    @objc static override public var supportsSecureCoding: Bool {
        // SKNode conforms to NSSecureCoding, so any subclass going
        // through the decoding process must support secure coding
        get {
            return true
        }
    }

    // Lets the user select a bottom item and allows clicking on the "next" button.
  func touchDown(atPoint pos : CGPoint) {
        if crepeTrousers.contains(pos) && crepeTrousers.alpha == 1{
            selectedBottom = crepeTrousers
        } else if skinnyJeans.contains(pos) && skinnyJeans.alpha == 1{
            selectedBottom = skinnyJeans
        } else if tailorPants.contains(pos) && tailorPants.alpha == 1{
            selectedBottom = tailorPants
        }
        if selectedBottom != nil{
            nextButton.alpha = 1
        }
//        if nextButton.alpha == 1{
//            if let nextGameScene = GameScene3(fileNamed: "GameScene3") {
//              nextGameScene.scaleMode = .aspectFit
//              self.scene?.view?.presentScene(nextGameScene, transition: SKTransition.fade(withDuration: TimeInterval(1)))
//            }
//        }
  }
    
    func touchMoved(toPoint pos : CGPoint) {
      
    }

    func touchUp(atPoint pos : CGPoint) {
      
    }

    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { touchDown(atPoint: t.location(in: self)) }
    }

    override public func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { touchMoved(toPoint: t.location(in: self)) }
    }

    override public func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { touchUp(atPoint: t.location(in: self)) }
    }

    override public func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { touchUp(atPoint: t.location(in: self)) }
    }

    override public func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}

