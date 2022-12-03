//
//  ViewController3.swift
//  lab
//
//  Created by supakit on 21/10/2564 BE.
//

import UIKit
import AVKit

class ViewController3: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func playmp4(_ sender: Any) {
        let path = Bundle.main.path(forResource: "viedo", ofType : "mp4")!
                let videoURL = URL(fileURLWithPath: path)
                let player = AVPlayer(url: videoURL)
                let playerViewController = AVPlayerViewController()
                playerViewController.player = player
                self.present(playerViewController, animated: true) {
                    playerViewController.player!.play()
                    }
    }
   
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
