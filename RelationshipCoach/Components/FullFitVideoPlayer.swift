//
//  FullFitVideoPlayer.swift
//  RelationshipCoach
//
//  Created by Manikanta Nandam on 29/03/25.
//

import SwiftUI
import AVKit

struct FullFitVideoPlayer: UIViewControllerRepresentable {
    let url: URL
    let height: CGFloat
    
    func makeUIViewController(context: Context) -> UIViewController {
        let controller = UIViewController()
        let player = AVPlayer(url: url)
        let playerLayer = AVPlayerLayer(player: player)
        
        playerLayer.videoGravity = .resizeAspectFill // Ensures full view fit
        playerLayer.frame = CGRect(x: 0, y: 0, width: controller.view.bounds.width, height: height)
        
        playerLayer.contentsScale = UIScreen.main.scale
        controller.view.layer.addSublayer(playerLayer)
        
        player.play()
        
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}
