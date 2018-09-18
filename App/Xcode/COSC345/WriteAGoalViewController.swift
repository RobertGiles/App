import UIKit

class WriteAGoalViewController: UIViewController {
    var listWriteVC = ["hi"]
    @IBOutlet weak var input: UITextField!
    @IBAction func addGoal(_ sender: Any) {
        if(input.text != ""){
            listWriteVC.append(input.text!)
            UserDefaults.standard.set(input.text, forKey: "cell")
            input.text = ""
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
