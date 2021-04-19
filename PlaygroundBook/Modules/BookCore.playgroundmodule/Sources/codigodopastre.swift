//import SpriteKit
//
//import SpriteKit
//
//public final class FinalScreen: SKScene {
//    
//    var sq1 = SKShapeNode(rectOf: .init(width: 100, height: 200))
//    var sq2 = SKShapeNode(rectOf: .init(width: 100, height: 200))
//    var sq3 = SKShapeNode(rectOf: .init(width: 100, height: 200))
//    
//    var touchCount = 0
//    
//    public override func didMove(to view: SKView) {
//        super.didMove(to: view)
//        
//        addChild(sq1)
//        addChild(sq2)
//        addChild(sq3)
//        
//        sq1.fillColor = .blue
//        sq2.fillColor = .brown
//        sq3.fillColor = .green
//        
//        sq1.position = .init(x: -50, y: 50)
//        sq2.position = .init(x: 50, y: 50)
//        sq3.position = .init(x: 0, y: 0)
//        
//        sq3.zPosition = 1000
//    }
//    
// 
//    func rotateCards(_ sq1: SKShapeNode, _ sq2: SKShapeNode, _ sq3: SKShapeNode) {
//        let arcCenterX = (
//            sq1.position.duplicated().x -
//            sq3.position.duplicated().x
//        ) / 2
//        let arcCenterY = (sq1.position.duplicated().y - sq3.position.duplicated().y) / 2
//        
//        let radius = sqrt(
//            (arcCenterX - sq3.position.duplicated().x) *
//            (arcCenterX - sq3.position.duplicated().x) +
//            (arcCenterY - sq3.position.duplicated().y) *
//            (arcCenterY - sq3.position.duplicated().y)
//        )
//        
//        let path3: UIBezierPath = .init(
//            arcCenter: .init(x: arcCenterX.rounded(), y: arcCenterY.rounded()),
//            radius: radius.rounded(),
//            startAngle: 315 * .pi / 180,
//            endAngle: 135 * .pi / 180,
//            clockwise: false
//        )
//        
//        
//        let x: CGFloat = (
//            sq3.position.duplicated().x -
//            sq2.position.duplicated().x
//        ) / 2
//        let y: CGFloat = (
//            sq3.position.duplicated().y -
//            sq2.position.duplicated().y
//        ) / 2
//        
//        let r = sqrt(
//            (sq3.position.duplicated().x - x) *
//            (sq3.position.duplicated().x - x) +
//                
//            (sq3.position.duplicated().y - y) *
//            (sq3.position.duplicated().y - y)
//        )
//        print(r)
//        let path2: UIBezierPath = .init(
//            arcCenter: .init(x: x.rounded(), y: y.rounded()),
//            radius: r.rounded(),
//            startAngle:  .pi / 4,
//            endAngle: 225 * .pi / 180,
//            clockwise: false
//        )
//        
//        let followAction2 = SKAction.follow(path2.cgPath, asOffset: true, orientToPath: false, duration: 1)
//        let followAction3 = SKAction.follow(path3.cgPath, asOffset: true, orientToPath: false, duration: 1)
//        
//        sq3.run(followAction3)
//        sq1.run(.move(to: sq2.position.duplicated(), duration: 1))
//        sq2.run(followAction2)
//            
//        
//    
//    }
//    
//    
//    
//    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        if touchCount % 3 == 0 {
//            rotateCards(sq1, sq2, sq3)
//            sq1.zPosition = 0
//            sq2.zPosition = 1000
//            sq3.zPosition = 0
//        }
//        else if touchCount % 3 == 1 {
//            rotateCards(sq3, sq1, sq2)
//            sq1.zPosition = 100
//            sq2.zPosition = 000
//            sq3.zPosition = 0
//        }
//        else if touchCount % 3 ==  2 {
//            rotateCards(sq2, sq3, sq1)
//            
//            sq1.zPosition = 0
//            sq2.zPosition = 000
//            sq3.zPosition = 100
//        }
//        touchCount += 1
//    }
//}
//
//
//
