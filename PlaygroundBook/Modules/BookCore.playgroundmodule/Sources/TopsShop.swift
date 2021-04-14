import SpriteKit

public class TopsShop: SKScene {

    var selectedTop: SKSpriteNode?
    lazy var capSleeveShirt = childNode(withName: "capSleeveShirt") as! SKSpriteNode
    lazy var cottonTshirt = childNode(withName: "cottonTshirt") as! SKSpriteNode
    lazy var knitPullover = childNode(withName:"knitPullover") as! SKSpriteNode
    lazy var nextButton = childNode(withName:"nextButton") as! SKSpriteNode

    public override func didMove(to view: SKView){
        let fadeInAction = SKAction.fadeIn(withDuration: 0.5)
        capSleeveShirt.run(fadeInAction)
        cottonTshirt.run(fadeInAction)
        knitPullover.run(fadeInAction)
    }

    //text.text = "frase aqui"
    @objc static override public var supportsSecureCoding: Bool {
        // SKNode conforms to NSSecureCoding, so any subclass going
        // through the decoding process must support secure coding
        get {
            return true
        }
    }

    // Lets the user select a top item and allows clicking on the "next" button.
    func touchDown(atPoint pos : CGPoint) {
        if capSleeveShirt.contains(pos) && capSleeveShirt.alpha == 1{
            //capSleeveShirt.alpha = 0
            selectedTop = capSleeveShirt
        } else if cottonTshirt.contains(pos) && cottonTshirt.alpha == 1{
            cottonTshirt.alpha = 0
            selectedTop = cottonTshirt
        } else if knitPullover.contains(pos) && knitPullover.alpha == 1{
            knitPullover.alpha = 0
            selectedTop = knitPullover
        }

        if selectedTop != nil{
            nextButton.alpha = 1
        }

        if nextButton.contains(pos){
            if let nextGameScene = BottomsShop(fileNamed: "BottomsShop") {
              nextGameScene.scaleMode = .aspectFit
              self.scene?.view?.presentScene(nextGameScene, transition: SKTransition.fade(withDuration: TimeInterval(1)))
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


