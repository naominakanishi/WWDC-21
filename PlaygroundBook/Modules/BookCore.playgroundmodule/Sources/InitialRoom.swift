import SpriteKit

//public class selectedItem {
//    static var selectedTop: SKSpriteNode?
//    static var selectedBottom: SKSpriteNode?
//}

public class GameScene: SKScene {

    lazy var balloon = childNode(withName: "balloon") as! SKSpriteNode
    lazy var text = balloon.childNode(withName: "text") as! SKLabelNode
    lazy var overlay = childNode(withName: "overlay") as! SKSpriteNode
    lazy var happyEarth = childNode(withName: "happyEarth") as! SKSpriteNode
    var dialogs = ["Buying new clothes can be fun, right?", "Do you ever consider the impact your clothes' production has on the environment, though?", "Wanna try a challenge? Buy yourself a new outfit, trying to make it as environmental-friendly as possible.", "For starters, pick a top item, then a bottom one. We'll then calculate your score."]
    
    public override func didMove(to view: SKView){
        let fadeInAction = SKAction.fadeIn(withDuration: 1)
        happyEarth.run(fadeInAction)
    }

    //text.text = "frase aqui"
    @objc static override public var supportsSecureCoding: Bool {
        // SKNode conforms to NSSecureCoding, so any subclass going
        // through the decoding process must support secure coding
        get {
            return true
        }
    }

    // Shows first balloon with message "Hi" (default)
    func touchDown(atPoint pos : CGPoint) {
        let fadeInAction = SKAction.fadeIn(withDuration: 0.3)
        balloon.run(fadeInAction)
        
        // verifies if user touched balloon area
        if balloon.alpha == 1{
            text.text = dialogs.first
            if dialogs.isEmpty {
                balloon.removeFromParent()
                if let nextGameScene = TopsShop(fileNamed: "TopsShop") {
                  nextGameScene.scaleMode = .aspectFit
                  self.scene?.view?.presentScene(nextGameScene, transition: SKTransition.fade(withDuration: TimeInterval(1)))
                }
            } else {
                dialogs.remove(at: 0)
            }
        }
        
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

