import SpriteKit

public class ResultsScreen: SKScene {
    
    lazy var happyEarth = childNode(withName: "happyEarth") as! SKSpriteNode
    lazy var interactionBalloon2 = childNode(withName: "interactionBalloon2") as! SKSpriteNode
    lazy var finalText = interactionBalloon2.childNode(withName: "finalText") as! SKLabelNode
    lazy var scoreTitles = childNode(withName: "scoreTitles") as! SKSpriteNode
    lazy var divider = childNode(withName: "divider") as! SKSpriteNode
    lazy var priceTag = childNode(withName: "priceTag") as! SKSpriteNode
    lazy var firstComparisonClothes = childNode(withName: "firstComparisonClothes") as! SKSpriteNode
    var selectedLook: SKSpriteNode?
    var firstDialogs = [//#1
                        "Sometimes we are tempted to consider only how things look and its price, but that can be very harmful for the environment.",
                        //#2
                        "Finding the balance between all aspects can be very challenging, but don't worry, I'm here to give you a hand.",
                        //#3: remove information
                        "In summary, we have to consider two aspects: how durable that piece is, and the harms they cause.",
                        //#4:
                        "In some cases, the choice is simpler.",
                        //#5:
                        "If an item causes less polution and lasts longer, for instance.",
                        //#6:
                        "Another aspect is the cost.",
                        //#7:
                        "Which pair of pants do you think have the best cost-benefit ratio?",
                        //#8:
                        "The first pair costs $30, the second costs $120",
                        //#9
                        "However, if you consider how long those pants will last, you'll end up spending more money buying pieces like the first one over and over.",
                        //#10
                        "We also have to think about the labor conditions in which our clothes are made.",
                        //#11
                        "To reduce the retail price, sometimes brands opt for poor labor conditions.",
                        //#12
                        "Even though this doesn't directly reflect on the environment, it reflects on many people's lives.",
                        //#13
                        "But I have some good news!",
                        //#14
                        "Clothes with longer durability also open doors to thrift shopping.",
                        //#15
                        "Thrift shopping is an amazing solution not only for people who can't afford the most environmental-friendly clothes, but also for the ones who like changing their closet every once in a while.",
                        //#16
                        "Always remember: the most sustainable clothes are the ones are that are already in our world."]
    
    lazy var lookArray = [childNode(withName: "1-1")!, childNode(withName: "1-2")!, childNode(withName: "1-3")!, childNode(withName: "2-1")!, childNode(withName: "2-2")!, childNode(withName: "2-3")!, childNode(withName: "3-1")!, childNode(withName: "3-2")!, childNode(withName: "3-3")!]
    
    lazy var priceArray = [priceTag.childNode(withName: "1-1-price")!, priceTag.childNode(withName: "1-2-price")!, priceTag.childNode(withName: "1-3-price")!, priceTag.childNode(withName: "2-1-price")!, priceTag.childNode(withName: "2-2-price")!, priceTag.childNode(withName: "2-3-price")!, priceTag.childNode(withName: "3-1-price")!, priceTag.childNode(withName: "3-2-price")!, priceTag.childNode(withName: "3-3-price")!]
    
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
        
        // retrieves information on which top and bottom were selected and displays the correct look on screen
        let topIndex = clothesNameIndexMap[selectedTop!.name!]!
        let bottomIndex = clothesNameIndexMap[selectedBottom!.name!]!
        lookArray.first(where: {node in node.name! == "\(topIndex)-\(bottomIndex)"})?.alpha = 1
        priceArray.first(where: {node in node.name! == "\(topIndex)-\(bottomIndex)-\("price")"})?.alpha = 1
        
        // uses previous information to display correct information about each piece
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
        //finds the time to control what's in the info board
        if firstDialogs.count == 13{ // at sentence #3
            let topIndex = clothesNameIndexMap[selectedTop!.name!]!
            let bottomIndex = clothesNameIndexMap[selectedBottom!.name!]!
            topsLookArray[topIndex - 1].alpha = 0
            bottomsLookArray[bottomIndex - 1].alpha = 0
            scoreTitles.alpha = 0
            divider.alpha = 0
            lookArray.first(where: {node in node.name! == "\(topIndex)-\(bottomIndex)"})?.alpha = 0
            priceTag.alpha = 0
        }
        if firstDialogs.count == 11{ // at sentence #5
            firstComparisonClothes.alpha = 1
            
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
