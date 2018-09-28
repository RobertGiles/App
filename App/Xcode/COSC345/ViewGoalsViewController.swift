import UIKit

/* View goals main constructor */
class ViewGoalsViewController: UIViewController {
    @IBOutlet weak var goalLabel: UILabel!
    @IBOutlet weak var myImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        goalLabel.text = listItemArray[myIndex]
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
}
