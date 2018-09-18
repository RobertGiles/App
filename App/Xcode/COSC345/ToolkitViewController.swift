import UIKit

@objcMembers class ForthViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Breathing Exercise"
        addPulse()
        // Do any additional setup after loading the view.
    }
    func addPulse(){ // Creates an animation instance
        let pulse = pulsing(radius: 160, position: avatarImageView.center)
        pulse.animationDuration = 4
        pulse.backgroundColor = UIColor.blue.cgColor
        self.view.layer.insertSublayer(pulse, below: avatarImageView.layer)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
