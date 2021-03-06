import SpriteKit

public class WorstResultsScreen: SKScene {
    
    var selectedLook: SKSpriteNode?
    lazy var happyEarth = childNode(withName: "happyEarth") as! SKSpriteNode
    lazy var finalBalloon = childNode(withName: "finalBalloon") as! SKSpriteNode
    lazy var finalText = finalBalloon.childNode(withName: "finalText") as! SKLabelNode
    lazy var scoreTitles = childNode(withName: "scoreTitles") as! SKSpriteNode
    lazy var priceTag = childNode(withName: "priceTag") as! SKSpriteNode
    lazy var firstComparisonClothes = childNode(withName: "firstComparisonClothes") as! SKSpriteNode

    var otherOptions = [//#1
                        "Uh-oh... Looks like you've picked the worst possible outfit!",
                        //#2
                        "Don't worry, though. I'm here to help you.",
                        //#3:
                        "When shopping, I know it's tempting to make decisions based on looks and price, but this can make me very sad.",
                        // #4
                        "A way to calculate the eco-friendly level of an outfit is to balance the positive and negative aspects.",
                        //#5:
                        "The positive ones are labor conditions and durability: the more points, the merrier.",
                        //#6:
                        "The negative ones are CO2 emission and water consumption. Here, the more, the worse.",
                        //#7:
                        "Keeping this in mind, the outfit you've picked is not great for the environment.",
                        //#8:
                        "It might not seem too harmful at first, but it has rather low durability and was produced under poor labor conditions.",
                        //#9:
                        "In addition, some fabrics don't last very long, which forces repurchasing items over and over, multiplying the environmental impact.",
                        //#10: switch here
                        "A good combination, however, would be this one.",
                        //#11 - wow face
                        "It might not be the cheapest option, but it can be used many times over the years!",
                        //#12
                        "I also have some other good news for you.",
                        //#13
                        "Clothes with longer durability also open doors to thrift shopping.",
                        //#14
                        "Thrift shopping is an amazing solution for people who can't afford these items, and also for people who like changing their closet every once in a while.",
                        //#15
                        "Always remember: the most sustainable clothes are the ones that are already on our world.",
                        //#16
                        "Thank you for your time! :)"]
    

    lazy var bestOptionPrice = priceTag.childNode(withName: "2-3-price") as! SKLabelNode
    lazy var worstOptionPrice = priceTag.childNode(withName: "1-2-price") as! SKLabelNode

    
    // vars for the animation
    // best case:
    lazy var imageA = childNode(withName: "1-2") as! SKSpriteNode
    // worst case:
    lazy var imageB = childNode(withName: "2-3") as! SKSpriteNode
    // selected:
//    var topIndex :Int{clothesNameIndexMap[selectedTop!.name!]!}
//    var bottomIndex :Int{clothesNameIndexMap[selectedBottom!.name!]!}
//
//    lazy var imageC = lookArray.first(where: {node in node.name! == "\(topIndex)-\(bottomIndex)"}) as! SKSpriteNode
    
    var touchCount = 0
    
    // variables for animating scores
    lazy var scoreA = childNode(withName: "1-2-score") as! SKSpriteNode
    lazy var scoreB = childNode(withName: "2-3-score") as! SKSpriteNode
//    lazy var scoreC = scoreArray.first(where: {node in node.name! == "\(topIndex)-\(bottomIndex)-\("score")"}) as! SKSpriteNode
//
    // end of animation vars

    public override func didMove(to view: SKView){
        let fadeInAction = SKAction.fadeIn(withDuration: 0.5)
        finalBalloon.run(fadeInAction)
        happyEarth.run(fadeInAction)
        
        worstOptionPrice.alpha = 1
        scoreA.alpha = 1
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
            if otherOptions.count > 1 {
                otherOptions.remove(at: 0)
            }
        }
        //finds the time to control what's in the info board
        
        if touchCount == 10{ // at sentence #3
//            if touchCount == 6 {
                rotateCards(imageA, imageB)
                imageA.zPosition = 0
                imageB.zPosition = 1000
                worstOptionPrice.alpha = 1
                bestOptionPrice.alpha = 0
                rotateCards(scoreA, scoreB, shouldRescale: false)
//            }
            
//            else if touchCount == 9 {
//                rotateCards(imageB, imageA)
//                imageA.zPosition = 000
//                imageB.zPosition = 100
//                worstOptionPrice.alpha = 0
//                bestOptionPrice.alpha = 1
//                rotateCards(scoreA, scoreB, shouldRescale: false)
//            }
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
    
    func rotateCards(_ imageA: SKSpriteNode, _ imageB: SKSpriteNode, shouldRescale: Bool = true) {
            let toA: CGPoint = .init(
                x: imageA.position.x,
                y: imageA.position.y)
            let toB: CGPoint = .init(
                x: imageB.position.x,
                y: imageB.position.y)
            let duration: TimeInterval = 1
        imageA.run(.group([
                            .move(to: toB, duration: duration),
            shouldRescale ? .scale(to: 0.6, duration: duration) : .run {},

            .fadeAlpha(to: 0.5, duration: duration)
        ]))
            imageB.run(.group([
                .fadeIn(withDuration: duration),
                shouldRescale ? .scale(to: 1, duration: duration) : .run {},
                .move(to: toA, duration: duration),
                    .fadeAlpha(to: 1, duration: duration)
            ]))
        }
    
}

