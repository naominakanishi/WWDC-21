import SpriteKit

public class ResultsScreen: SKScene {
    
    var selectedLook: SKSpriteNode?
    lazy var happyEarth = childNode(withName: "happyEarth") as! SKSpriteNode
    lazy var finalBalloon = childNode(withName: "finalBalloon") as! SKSpriteNode
    lazy var finalText = finalBalloon.childNode(withName: "finalText") as! SKLabelNode
    lazy var scoreTitles = childNode(withName: "scoreTitles") as! SKSpriteNode
    lazy var priceTag = childNode(withName: "priceTag") as! SKSpriteNode
    lazy var firstComparisonClothes = childNode(withName: "firstComparisonClothes") as! SKSpriteNode

    var otherOptions = [//#1
                        "Almost there! Your choice was not the best possible, but was not the worst either.",
                        //#2
                        "When shopping, I know it's tempting to make decisions based on looks and price, but this can make me very sad.",
                        //#3:
                        "A way to calculate the eco-friendly level of an outfit is to balance the positive and negative aspects.",
                        //#4:
                        "The positive ones are the labor conditions and durability: the more points, the merrier.",
                        //#5:
                        "The negative ones are CO2 emission and water consumption. Here, the more, the worse.",
                        //#6: switch here.
                        "Keeping this in mind, a bad combination would be this outfit.",
                        //#7:
                        "It might not seem too harmful at first, but it has rather low durability and was produced under poor labor conditions.",
                        //#8:
                        "In addition, some fabrics don't last very long, making people repurchase items over and over, multiplying the environmental impact.",
                        //#9: switch again
                        "A good combination, however, would be this one.",
                        //#10 - wow face
                        "It might not be the cheapest option, but hey: think about how many times you can use the same item!",
                        //#11
                        "I also have some other good news for you.",
                        //#12
                        "Clothes with longer durability also open doors to thrift shopping.",
                        //#13
                        "Thrift shopping is an amazing solution for people who can't afford these items, and also for people who like changing their closet every one in a while.",
                        //#14
                        "Always remember: the most sustainable clothes are the ones that are already on our world."]
    
    lazy var lookArray = [childNode(withName: "1-1")!, childNode(withName: "1-2")!, childNode(withName: "1-3")!, childNode(withName: "2-1")!, childNode(withName: "2-2")!, childNode(withName: "2-3")!, childNode(withName: "3-1")!, childNode(withName: "3-2")!, childNode(withName: "3-3")!]
    
    lazy var priceArray = [priceTag.childNode(withName: "1-1-price")!, priceTag.childNode(withName: "1-2-price")!, priceTag.childNode(withName: "1-3-price")!, priceTag.childNode(withName: "2-1-price")!, priceTag.childNode(withName: "2-2-price")!, priceTag.childNode(withName: "2-3-price")!, priceTag.childNode(withName: "3-1-price")!, priceTag.childNode(withName: "3-2-price")!, priceTag.childNode(withName: "3-3-price")!]
    
    lazy var scoreArray = [childNode(withName: "1-1-score")!, childNode(withName: "1-2-score")!, childNode(withName: "1-3-score")!, childNode(withName: "2-1-score")!, childNode(withName: "2-2-score")!, childNode(withName: "2-3-score")!, childNode(withName: "3-1-score")!, childNode(withName: "3-2-score")!, childNode(withName: "3-3-score")!]
    

    lazy var clothesNameIndexMap = ["capSleeveShirt": 1,
                               "cottonTshirt": 2,
                               "knitPullover": 3,
                               "crepeTrousers": 1,
                               "skinnyJeans": 2,
                               "tailorPants": 3]
    
    // vars for the animation
    // best case:
    lazy var imageA = childNode(withName: "2-3") as! SKSpriteNode
    // worst case:
    lazy var imageB = childNode(withName: "1-2") as! SKSpriteNode
    // selected:
    var topIndex :Int{clothesNameIndexMap[selectedTop!.name!]!}
    var bottomIndex :Int{clothesNameIndexMap[selectedBottom!.name!]!}
    
    lazy var imageC = lookArray.first(where: {node in node.name! == "\(topIndex)-\(bottomIndex)"}) as! SKSpriteNode
    
    var touchCount = 0
    
    // variables for animating scores
    lazy var scoreA = childNode(withName: "2-3-score") as! SKSpriteNode
    lazy var scoreB = childNode(withName: "1-2-score") as! SKSpriteNode
   // lazy var scoreC = lookArray.first(where: {node in node.name! == "\(topIndex)-\(bottomIndex)-\("score")"}) as! SKSpriteNode
    
    // end of animation vars

    public override func didMove(to view: SKView){
        let fadeInAction = SKAction.fadeIn(withDuration: 0.5)
        finalBalloon.run(fadeInAction)
        happyEarth.run(fadeInAction)
        
        // uses previous information to display correct price information
        let topIndex = clothesNameIndexMap[selectedTop!.name!]!
        let bottomIndex = clothesNameIndexMap[selectedBottom!.name!]!
        priceArray.first(where: {node in node.name! == "\(topIndex)-\(bottomIndex)-\("price")"})?.alpha = 1
        imageC.alpha = 1
      //  scoreC.alpha = 1
        
        
//        // retrieves information on which top and bottom were selected and displays the correct look on screen
//        let topIndex = clothesNameIndexMap[selectedTop!.name!]!
//        let bottomIndex = clothesNameIndexMap[selectedBottom!.name!]!
//        lookArray.first(where: {node in node.name! == "\(topIndex)-\(bottomIndex)"})?.alpha = 1
//        priceArray.first(where: {node in node.name! == "\(topIndex)-\(bottomIndex)-\("price")"})?.alpha = 1
//
//        // uses previous information to display correct information about each piece
//        topsLookArray[topIndex - 1].alpha = 1
//        bottomsLookArray[bottomIndex - 1].alpha = 1
    }
    
    @objc static override public var supportsSecureCoding: Bool {
        // SKNode conforms to NSSecureCoding, so any subclass going
        // through the decoding process must support secure coding
        get {
            return true
        }
    }
    
    func touchDown(atPoint pos : CGPoint) {
        touchCount += 1
        if finalBalloon.contains(pos){
            finalText.text = otherOptions.first
            if otherOptions.isEmpty {
                finalText.removeFromParent()
            } else {
                otherOptions.remove(at: 0)
            }
        }
        //finds the time to control what's in the info board
            if touchCount == 6{ // at sentence #3
//            let topIndex = clothesNameIndexMap[selectedTop!.name!]!
//            let bottomIndex = clothesNameIndexMap[selectedBottom!.name!]!
//            scoreTitles.alpha = 0
//            lookArray.first(where: {node in node.name! == "\(topIndex)-\(bottomIndex)"})?.alpha = 0
//            priceTag.alpha = 0
            if touchCount % 3 == 0 {
                rotateCards(imageA, imageB, imageC)
                imageA.zPosition = 0
                imageB.zPosition = 1000
                imageC.zPosition = 0
            }
            else if touchCount % 3 == 1 {
                rotateCards(imageC, imageA, imageB)
                imageA.zPosition = 100
                imageB.zPosition = 000
                imageC.zPosition = 0
            }
            else if touchCount % 3 ==  2 {
                rotateCards(imageB, imageC, imageA)
                
                imageA.zPosition = 0
                imageB.zPosition = 000
                imageC.zPosition = 100
            }
        }

                
//        if touchCount % 3 == 0 {
//            rotateCards(imageA, imageB, imageC)
//            imageA.zPosition = 0
//            imageB.zPosition = 1000
//            imageC.zPosition = 0
//        }
//        else if touchCount % 3 == 1 {
//            rotateCards(imageC, imageA, imageB)
//            imageA.zPosition = 100
//            imageB.zPosition = 000
//            imageC.zPosition = 0
//        }
//        else if touchCount % 3 ==  2 {
//            rotateCards(imageB, imageC, imageA)
//
//            imageA.zPosition = 0
//            imageB.zPosition = 000
//            imageC.zPosition = 100
//        }
//       touchCount += 1
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
    
    func rotateCards(_ imageA: SKSpriteNode, _ imageB: SKSpriteNode, _ imageC: SKSpriteNode) {
            let toA: CGPoint = .init(
                x: imageA.position.x,
                y: imageA.position.y)
            let toB: CGPoint = .init(
                x: imageB.position.x,
                y: imageB.position.y)
            let toC: CGPoint = .init(
                x: imageC.position.x,
                y: imageC.position.y)
            let duration: TimeInterval = 1
            imageA.run(.move(to: toB, duration: duration))
            imageB.run(.group([
                .fadeIn(withDuration: duration),
                .scale(to: 1, duration: duration),
                .move(to: toC, duration: duration)
            ]))
            imageC.run(.group([
                .scale(to: 0.6, duration: duration),
                .fadeAlpha(to: 0.5, duration: duration),
                .move(to: toA, duration: duration)
            ]))
        }
    
}

extension CGPoint {
    func duplicated() -> Self {
        .init(x: self.x, y: self.y)
    }
}
