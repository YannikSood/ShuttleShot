//
//  GameViewController.swift
//  ShuttleShot
//
//  Created by Yannik Sood on 10/19/18.
//  Copyright © 2018 Yannik Sood. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit
import GoogleMobileAds

class GameViewController: UIViewController, GADBannerViewDelegate {
    
    var BannerAd: GADBannerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            if (!UserDefaults.standard.bool(forKey: "noAds")) {
                BannerAd = GADBannerView(adSize: kGADAdSizeSmartBannerPortrait, origin: CGPoint(x: 0, y:  self.view!.frame.height - 50))
                BannerAd.delegate = self
                BannerAd.adUnitID = "ca-app-pub-2278671587036936/8502791929"
                BannerAd.rootViewController = self
                let request = GADRequest()
                BannerAd.load(request)
                self.adViewDidReceiveAd(BannerAd)
                view.addSubview(BannerAd)
            }
            
            
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "MenuScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                // Present the scene
                view.presentScene(scene)
                
            }
        }
    }
    
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func positionBannerViewFullWidthAtBottomOfView(_ bannerView: UIView) {
        view.addConstraint(NSLayoutConstraint(item: bannerView,
                                              attribute: .leading,
                                              relatedBy: .equal,
                                              toItem: view,
                                              attribute: .leading,
                                              multiplier: 1,
                                              constant: 0))
        view.addConstraint(NSLayoutConstraint(item: bannerView,
                                              attribute: .trailing,
                                              relatedBy: .equal,
                                              toItem: view,
                                              attribute: .trailing,
                                              multiplier: 1,
                                              constant: 0))
        view.addConstraint(NSLayoutConstraint(item: bannerView,
                                              attribute: .bottom,
                                              relatedBy: .equal,
                                              toItem: view.safeAreaLayoutGuide.bottomAnchor,
                                              attribute: .top,
                                              multiplier: 1,
                                              constant: 0))
    }
    
    func adViewDidReceiveAd(_ bannerView: GADBannerView) {
        print("adViewDidReceiveAd")
    }
}
extension SwiftyMusic.FileName {
    static let menu = SwiftyMusic.FileName("background")
    static let game = SwiftyMusic.FileName("transmission")
    
    static var all: [SwiftyMusic.FileName] = [.menu, .game]
}
