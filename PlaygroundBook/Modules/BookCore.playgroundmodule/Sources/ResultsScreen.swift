import SpriteKit

public class ResultsScreen: SKScene {
    
    lazy var happyEarth = childNode(withName: "happyEarth") as! SKSpriteNode
    lazy var interactionBalloon2 = childNode(withName: "interactionBalloon2") as! SKSpriteNode
    lazy var finalText = interactionBalloon2.childNode(withName: "finalText") as! SKLabelNode
    var selectedLook: SKSpriteNode?
    var dialogs = ["Picking clothes considering aspects other than the price and looks can be challenging, right?", "It's also hard to find a way to balance all aspects...",  "For instance, you can pick a piece that doesn't use much water to be produced...", "But how long will this item last?", "Depending on its durability, sometimes a piece that seems more harmful for the environment at first will end up being better in the long run."]
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
//        if crepeTrousers.contains(pos) && crepeTrousers.alpha == 1{
//            selectedBottom = crepeTrousers
//            crepeTrousersSelect.alpha = 1
//            skinnyJeansSelect.alpha = 0
//            tailorPantsSelect.alpha = 0
//        } else if skinnyJeans.contains(pos) && skinnyJeans.alpha == 1{
//            selectedBottom = skinnyJeans
//            crepeTrousersSelect.alpha = 0
//            skinnyJeansSelect.alpha = 1
//            tailorPantsSelect.alpha = 0
//        } else if tailorPants.contains(pos) && tailorPants.alpha == 1{
//            selectedBottom = tailorPants
//            crepeTrousersSelect.alpha = 0
//            skinnyJeansSelect.alpha = 0
//            tailorPantsSelect.alpha = 1
//        }
//        if selectedBottom != nil{
//            nextButton.alpha = 1
//            nextButtonSelect.alpha = 1
//
//        }
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

