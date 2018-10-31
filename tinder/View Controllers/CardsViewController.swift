//
//  CardsViewController.swift
//  tinder
//
//  Created by Brandon Shimizu on 10/30/18.
//  Copyright © 2018 Brandon Shimizu. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {
    
    
    @IBOutlet weak var card: UIImageView!
    var cardImage : UIImage = UIImage(named:"ryan")!
    var cardInitialCenter: CGPoint!
    var cardCenter: CGPoint!
    var divisor: CGFloat!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(didPanCard(_:)))
        card.isUserInteractionEnabled = true
        card.addGestureRecognizer(panGestureRecognizer)
        divisor = (view.frame.width / 2)/0.66
        
    }
    
    func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) -> CGPoint {
        let touch = touches.first!
        let location = touch.location(in: card)
        print(location.x)
        print(location.y)
        
        return(location)
    }
    
    
    @IBAction func didPanCard(_ sender: UIPanGestureRecognizer) {
        let location = sender.location(in: view)
        let translation = sender.translation(in: view)
        let xFromCenter = card.center.x - view.center.x
        
        if sender.state == .began {
            print("Gesture began")
            cardCenter = card.center
        } else if sender.state == .changed {
            print("Gesture is changing")
            if(location.y > cardCenter.y){
                card.transform = CGAffineTransform(rotationAngle: (-xFromCenter)/divisor)
                card.center = CGPoint(x: cardCenter.x + translation.x, y: cardCenter.y)
            }
            else {
                card.transform = CGAffineTransform(rotationAngle: xFromCenter/divisor)
                card.center = CGPoint(x: cardCenter.x + translation.x, y: cardCenter.y)
            }
        } else if sender.state == .ended {
            print("Gesture ended")
            if (card.center.x < 75){
                UIView.animate(withDuration: 0.3, animations: {
                    self.card.alpha = 0
                    self.card.center = CGPoint(x: self.card.center.x - 75, y: self.card.center.y)
                }){(Bool) in
                    self.resetCard()
                }
                return
            }else if (card.center.x > (view.frame.width - 75)) {
                UIView.animate(withDuration: 0.3, animations: {
                    self.card.alpha = 0
                    self.card.center = CGPoint(x: self.card.center.x + 150, y: self.card.center.y)
                }){(Bool) in
                    self.resetCard()
                }
                return
            }
            resetCard()
        }
    }
    
    func resetCard() {
        self.card.transform = CGAffineTransform.identity
        self.card.center = self.view.center
        self.card.alpha = 1
    }
    
    @IBAction func didTapCard(_ sender: UITapGestureRecognizer) {
        performSegue(withIdentifier: "cardTap", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "cardTap" {
            let dvc = segue.destination as? ProfileViewController
            dvc?.newImage = UIImage(named: "ryan")!
            
        }
    }
    

    
}
