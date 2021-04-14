import SpriteKit

public class BottomsShop: SKScene {
    
    var selectedBottom: SKSpriteNode?
    lazy var crepeTrousers = childNode(withName: "crepeTrousers") as! SKSpriteNode
    lazy var skinnyJeans = childNode(withName: "skinnyJeans") as! SKSpriteNode
    lazy var tailorPants = childNode(withName:"tailorPants") as! SKSpriteNode
    lazy var nextButton = childNode(withName:"nextButton") as! SKSpriteNode
    lazy var mannequinCapSleeves = childNode(withName: "mannequinCapSleeves") as! SKSpriteNode
    lazy var mannequinCottonTshirt = childNode(withName: "mannequinCottonTshirt") as! SKSpriteNode
    lazy var mannequinKnitPullover = childNode(withName: "mannequinKnitPullover") as! SKSpriteNode
    lazy var crepeTrousersSelect = childNode(withName: "crepeTrousersSelect") as! SKSpriteNode
    lazy var skinnyJeansSelect = childNode(withName: "skinnyJeansSelect") as! SKSpriteNode
    lazy var tailorPantsSelect = childNode(withName: "tailorPantsSelect") as! SKSpriteNode
    lazy var nextButtonSelect = childNode(withName: "nextButtonSelect") as! SKSpriteNode
    
    public override func didMove(to view: SKView){
        let fadeInAction = SKAction.fadeIn(withDuration: 0.5)
        crepeTrousers.run(fadeInAction)
        skinnyJeans.run(fadeInAction)
        tailorPants.run(fadeInAction)
        if selectedTop?.name == "capSleeveShirt" {
            mannequinCapSleeves.alpha = 1
        } else if selectedTop?.name == "cottonTshirt"{
            mannequinCottonTshirt.alpha = 1
        } else if selectedTop?.name == "knitPullover"{
            mannequinKnitPullover.alpha = 1
        }
        
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
            crepeTrousersSelect.alpha = 1
            skinnyJeansSelect.alpha = 0
            tailorPantsSelect.alpha = 0
        } else if skinnyJeans.contains(pos) && skinnyJeans.alpha == 1{
            selectedBottom = skinnyJeans
            crepeTrousersSelect.alpha = 0
            skinnyJeansSelect.alpha = 1
            tailorPantsSelect.alpha = 0
        } else if tailorPants.contains(pos) && tailorPants.alpha == 1{
            selectedBottom = tailorPants
            crepeTrousersSelect.alpha = 0
            skinnyJeansSelect.alpha = 0
            tailorPantsSelect.alpha = 1
        }
        if selectedBottom != nil{
            nextButton.alpha = 1
            nextButtonSelect.alpha = 1
            
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

