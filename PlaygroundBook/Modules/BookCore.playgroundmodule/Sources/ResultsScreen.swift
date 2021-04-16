import SpriteKit

public class ResultsScreen: SKScene {
    
    lazy var happyEarth = childNode(withName: "happyEarth") as! SKSpriteNode
    lazy var interactionBalloon2 = childNode(withName: "interactionBalloon2") as! SKSpriteNode
    lazy var finalText = interactionBalloon2.childNode(withName: "finalText") as! SKLabelNode
    var selectedLook: SKSpriteNode?
    var firstDialogs = ["Sometimes we are tempted to consider only how things look and its price, but that can be very harmful for the environment.", "Finding the balance between all aspects can be very challenging, but don't worry, I'm here to give you a hand.", "In summary, we have to consider two aspects: how durable that piece is, and the harms they cause.", "Even though some pieces seem to be less harmful at first...", "...in the long run, when we take into account how long it'll last, it might cause more damage than another that seems more pollutant.", "The same logic applies to the cost.", "Which pair of pants do you think have the best cost-benefit ratio?"]
    lazy var lookArray = [childNode(withName: "1-1")!, childNode(withName: "1-2")!, childNode(withName: "1-3")!, childNode(withName: "2-1")!, childNode(withName: "2-2")!, childNode(withName: "2-3")!, childNode(withName: "3-1")!, childNode(withName: "3-2")!, childNode(withName: "3-3")!]
    lazy var topsLookArray = [childNode(withName: "capSleeveInfo")!, childNode(withName: "cottonTshirtInfo")!, childNode(withName: "knitPulloverInfo")!]
    lazy var bottomsLookArray = [childNode(withName: "crepeTrousersInfo")!, childNode(withName: "skinnyJeansInfo")!, childNode(withName: "tailorPantsInfo")!]

    let clothesNameIndexMap = ["capSleeveShirt": 1,
                               "cottonTshirt": 2,
                               "knitPullover": 3,
                               "crepeTrousers": 1,
                               "skinnyJeans": 2,
                               "tailorPants": 3]
    
    public override func didMove(to view: SKView){
        let fadeInAction = SKAction.fadeIn(withDuration: 0.5)
        interactionBalloon2.run(fadeInAction)
        happyEarth.run(fadeInAction)
        
        let topIndex = clothesNameIndexMap[selectedTop!.name!]!
        let bottomIndex = clothesNameIndexMap[selectedBottom!.name!]!
        lookArray.first(where: {node in node.name! == "\(topIndex)-\(bottomIndex)"})?.alpha = 1
        
        topsLookArray[topIndex - 1].alpha = 1
        bottomsLookArray[bottomIndex - 1].alpha = 1
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
    if interactionBalloon2.contains(pos){
    finalText.text = firstDialogs.first
    if firstDialogs.isEmpty {
        finalText.removeFromParent()
        } else {
        firstDialogs.remove(at: 0)
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

