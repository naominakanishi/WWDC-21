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
    
    lazy var lookArray = [childNode(withName: "1-1-final")!, childNode(withName: "1-2-final")!, childNode(withName: "1-3-final")!, childNode(withName: "2-1-final")!, childNode(withName: "2-2-final")!, childNode(withName: "2-3-final")!, childNode(withName: "3-1-final")!, childNode(withName: "3-2-final")!, childNode(withName: "3-3-final")!]
    
    lazy var priceArray = [priceTag.childNode(withName: "1-1-price")!, priceTag.childNode(withName: "1-2-price")!, priceTag.childNode(withName: "1-3-price")!, priceTag.childNode(withName: "2-1-price")!, priceTag.childNode(withName: "2-2-price")!, priceTag.childNode(withName: "2-3-price")!, priceTag.childNode(withName: "3-1-price")!, priceTag.childNode(withName: "3-2-price")!, priceTag.childNode(withName: "3-3-price")!]
    
    lazy var topsLookArray = [childNode(withName: "capSleeveInfo")!, childNode(withName: "cottonTshirtInfo")!, childNode(withName: "knitPulloverInfo")!]
    lazy var bottomsLookArray = [childNode(withName: "crepeTrousersInfo")!, childNode(withName: "skinnyJeansInfo")!, childNode(withName: "tailorPantsInfo")!]
    
    lazy var clothesNameIndexMap = ["capSleeveShirt": 1,
                               "cottonTshirt": 2,
                               "knitPullover": 3,
                               "crepeTrousers": 1,
                               "skinnyJeans": 2,
                               "tailorPants": 3]
    
    // vars for the animation
    // best case:
    lazy var imageA = childNode(withName: "2-3-final") as! SKSpriteNode
    // worst case:
    lazy var imageB = childNode(withName: "1-2-final") as! SKSpriteNode
    // selected:
    var topIndex :Int{clothesNameIndexMap[selectedTop!.name!]!}
    var bottomIndex :Int{clothesNameIndexMap[selectedBottom!.name!]!}
    lazy var imageC = lookArray.first(where: {node in node.name! == "\(topIndex)-\(bottomIndex)-\("final")"}) as! SKSpriteNode
    
   
    var touchCount = 0
    
    // end of animation vars

    public override func didMove(to view: SKView){
        let fadeInAction = SKAction.fadeIn(withDuration: 0.5)
        finalBalloon.run(fadeInAction)
        happyEarth.run(fadeInAction)
        
        // uses previous information to display correct price information
        let topIndex = clothesNameIndexMap[selectedTop!.name!]!
        let bottomIndex = clothesNameIndexMap[selectedBottom!.name!]!
        topsLookArray[topIndex - 1].alpha = 1
        bottomsLookArray[bottomIndex - 1].alpha = 1
        priceArray.first(where: {node in node.name! == "\(topIndex)-\(bottomIndex)-\("price")"})?.alpha = 1
        imageC.alpha = 1

        
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
    
    //text.text = "frase aqui"
    @objc static override public var supportsSecureCoding: Bool {
        // SKNode conforms to NSSecureCoding, so any subclass going
        // through the decoding process must support secure coding
        get {
            return true
        }
    }
    
    func touchDown(atPoint pos : CGPoint) {
        if finalBalloon.contains(pos){
            finalText.text = otherOptions.first
            if otherOptions.isEmpty {
                finalText.removeFromParent()
            } else {
                otherOptions.remove(at: 0)
            }
        }
        //finds the time to control what's in the info board
        if otherOptions.count == 13{ // at sentence #3
            let topIndex = clothesNameIndexMap[selectedTop!.name!]!
            let bottomIndex = clothesNameIndexMap[selectedBottom!.name!]!
            topsLookArray[topIndex - 1].alpha = 0
            bottomsLookArray[bottomIndex - 1].alpha = 0
            scoreTitles.alpha = 0
            lookArray.first(where: {node in node.name! == "\(topIndex)-\(bottomIndex)"})?.alpha = 0
            priceTag.alpha = 0
        }
        if otherOptions.count == 11{ // at sentence #5
            firstComparisonClothes.alpha = 1
            
        }
//        fatalError("\(imageA.anchorPoint), \(imageB.anchorPoint), \(imageC.anchorPoint), \(anchorPoint)")
        
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
//        touchCount += 1
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
        let arcCenterX = (
            imageA.position.duplicated().x -
            imageC.position.duplicated().x
        ) / 2
        let arcCenterY = (imageA.position.duplicated().y - imageC.position.duplicated().y) / 2
        
        let radius = sqrt(
            (arcCenterX - imageC.position.duplicated().x) *
            (arcCenterX - imageC.position.duplicated().x) +
            (arcCenterY - imageC.position.duplicated().y) *
            (arcCenterY - imageC.position.duplicated().y)
        )
        
        let path3: UIBezierPath = .init(
            arcCenter: .init(x: arcCenterX.rounded(), y: arcCenterY.rounded()),
            radius: radius.rounded(),
            startAngle: 315 * .pi / 180,
            endAngle: 135 * .pi / 180,
            clockwise: false
        )
        
        
        let x: CGFloat = (
            imageC.position.duplicated().x -
            imageB.position.duplicated().x
        ) / 2
        let y: CGFloat = (
            imageC.position.duplicated().y -
            imageB.position.duplicated().y
        ) / 2
        
        let r = sqrt(
            (imageC.position.duplicated().x - x) *
            (imageC.position.duplicated().x - x) +
                
            (imageC.position.duplicated().y - y) *
            (imageC.position.duplicated().y - y)
        )
        print(r)
        let path2: UIBezierPath = .init(
            arcCenter: .init(x: x.rounded(), y: y.rounded()),
            radius: r.rounded(),
            startAngle:  .pi / 4,
            endAngle: 225 * .pi / 180,
            clockwise: false
        )
        
        let followAction2 = SKAction.follow(path2.cgPath, asOffset: true, orientToPath: false, duration: 1)
        let followAction3 = SKAction.follow(path3.cgPath, asOffset: true, orientToPath: false, duration: 1)
        
        imageC.run(.group([followAction3]))
        imageA.run(.group([.move(to: imageB.position.duplicated(), duration: 1)]))
        imageB.run(.group([followAction2]))
    }
    
}

extension CGPoint {
    func duplicated() -> Self {
        .init(x: self.x, y: self.y)
    }
}
