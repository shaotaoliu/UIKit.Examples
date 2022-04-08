import UIKit
import AVFoundation
import AVKit

class MusicViewController: UIViewController {

    @IBOutlet weak var videoView: UIView!
    @IBOutlet weak var playImage: UIImageView!
    @IBOutlet weak var playButton: UIButton!
    
    private var audioPlayer: AVAudioPlayer!
    private var videoPlayer: AVPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = Bundle.main.url(forResource: "music.mp3", withExtension: nil) {
            audioPlayer = try! AVAudioPlayer(contentsOf: url)
            audioPlayer.numberOfLoops = -1
            audioPlayer.prepareToPlay()
        }
        
        if let url = Bundle.main.url(forResource: "train", withExtension: "m4v") {
            videoPlayer = AVPlayer(url: url)
            let layer = AVPlayerLayer(player: videoPlayer)
            layer.frame = videoView.bounds
            layer.videoGravity = .resizeAspect
            videoView.layer.addSublayer(layer)
        }
    }

    @IBAction func buttonTapped(_ sender: Any) {
        guard let aPlayer = audioPlayer else {
            return
        }
        
        if let vPlayer = videoPlayer {
            vPlayer.pause()
        }
        
        if aPlayer.isPlaying {
            playImage.image = UIImage(systemName: "play.circle.fill")
            playButton.setTitle("Play", for: .normal)
            aPlayer.stop()
        }
        else {
            playImage.image = UIImage(systemName: "stop.circle.fill")
            playButton.setTitle("Stop", for: .normal)
            aPlayer.play()
        }
    }
    
    @IBAction func videoTapper(_ sender: Any) {
        if let aPlayer = audioPlayer, aPlayer.isPlaying {
            aPlayer.stop()
        }
        
        if let vPlayer = videoPlayer {
            vPlayer.play()
        }
    }
    
    @IBAction func video2Player(_ sender: Any) {
        if let aPlayer = audioPlayer, aPlayer.isPlaying {
            aPlayer.stop()
        }
        
        guard let vPlayer = videoPlayer else {
            return
        }
        
        let vc = AVPlayerViewController()
        vc.player = vPlayer
        vPlayer.play()
        present(vc, animated: true)
    }
    
}
