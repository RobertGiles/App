import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Home"
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //This function applies a button function to the DiaryVC from the MainVC
    @IBAction func clickDiaryVC(_ sender: AnyObject) {
        // Creates a constant variable using storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        // DiaryViewController constant variable for nav
        let diaryVC = storyboard.instantiateViewController(withIdentifier: "DiaryViewController")as!
            DiaryViewController
        //This pushes the VC by using Nav controller
        self.navigationController?.pushViewController(diaryVC, animated: true)
    }
    
    //This function applies a button to the GoalView VC from the MainVC
    @IBAction func clickThirdVC(_ sender: AnyObject) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let thirdVC = storyboard.instantiateViewController(withIdentifier: "GoalViewController")as!
            GoalViewController
        self.navigationController?.pushViewController(thirdVC, animated: true)
    }
    
    //  Links a button to the InfoViewController from the Main (Home) screen.
    @IBAction func clickFifthVC(_ sender: AnyObject) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let fifthVC = storyboard.instantiateViewController(withIdentifier: "InfoViewController")as!
        InfoViewController
        self.navigationController?.pushViewController(fifthVC, animated: true)
    }
}





