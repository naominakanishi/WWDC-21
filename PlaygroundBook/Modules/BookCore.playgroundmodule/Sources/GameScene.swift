import SpriteKit

public class GameScene: SKScene {

    lazy var balloon = childNode(withName: "balloon") as! SKSpriteNode
    lazy var text = balloon.childNode(withName: "text") as! SKLabelNode
    lazy var overlay = childNode(withName: "overlay") as! SKSpriteNode
    lazy var happyEarth = childNode(withName: "happyEarth") as! SKSpriteNode
    
    public override func didMove(to view: SKView) {
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

    func touchDown(atPoint pos : CGPoint) {
        text.text = "\(pos)"
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

