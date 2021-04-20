import SpriteKit
public var selectedBottom: SKSpriteNode?

public class BottomsShop: SKScene {
    
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
    lazy var mannequinArray = [childNode(withName: "1-0-mannequin")!, childNode(withName: "2-0-mannequin")!, childNode(withName: "3-0-mannequin")!, childNode(withName: "1-1-mannequin")!, childNode(withName: "1-2-mannequin")!, childNode(withName: "1-3-mannequin")!, childNode(withName: "2-1-mannequin")!, childNode(withName: "2-2-mannequin")!, childNode(withName: "2-3-mannequin")!, childNode(withName: "3-1-mannequin")!, childNode(withName: "3-2-mannequin")!, childNode(withName: "3-3-mannequin")!]
   
    let clothesNameIndexMap = ["capSleeveShirt": 1,
                               "cottonTshirt": 2,
                               "knitPullover": 3,
                               "crepeTrousers": 1,
                               "skinnyJeans": 2,
                               "tailorPants": 3]
    
    public override func didMove(to view: SKView){
        let fadeInAction = SKAction.fadeIn(withDuration: 0.5)
        crepeTrousers.run(fadeInAction)
        skinnyJeans.run(fadeInAction)
        tailorPants.run(fadeInAction)
        
        guard let selectedTopName = selectedTop?.name,
        let topIndex = clothesNameIndexMap[selectedTopName]
        else { return }
        let bottomIndex = 0
        mannequinArray.first(where: {node in node.name! == "\(topIndex)-\(bottomIndex)-\("mannequin")"})?.alpha = 1
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
    if self.contains (pos) && (crepeTrousers.contains (pos) || skinnyJeans.contains (pos) || tailorPants.contains (pos) || nextButton.contains (pos)) {
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
            }
            mannequinArray.forEach({node in node.alpha = 0})
            // retrieves information on which top and bottom were selected and displays the correct look on screen
            let topIndex = clothesNameIndexMap[selectedTop!.name!]!
            let bottomIndex = clothesNameIndexMap[selectedBottom!.name!]!
            mannequinArray.first(where: {node in node.name! == "\(topIndex)-\(bottomIndex)-\("mannequin")"})?.alpha = 1


            if nextButton.contains(pos){
                if let nextGameScene = ResultsScreen(fileNamed: "ResultsScreen") {
                  nextGameScene.scaleMode = .aspectFit
                  self.scene?.view?.presentScene(nextGameScene, transition: SKTransition.fade(withDuration: TimeInterval(1)))
                }
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

