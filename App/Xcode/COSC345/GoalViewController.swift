import UIKit

class GoalViewController: UIViewController {
    
    // Actions to take on successful load of the view.
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "My Goals"
        // Do any additional setup after loading the view.
    }
    
    // Actions to take on memory warning received.
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Activates the WriteAGoal ViewController.
    @IBAction func writeAGoalVC(_ sender: AnyObject) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let toWriteAGoal = storyboard.instantiateViewController(withIdentifier: "WriteAGoalViewController")as!WriteAGoalViewController
        self.navigationController?.pushViewController(toWriteAGoal, animated: true)
    }
    
    // Activates the WhatIsAGoal ViewController.
    @IBAction func whatIsAGoalVC(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let toWhatisGoal = storyboard.instantiateViewController(withIdentifier: "WhatisAGoalViewController")as!WhatisAGoalViewController
        self.navigationController?.pushViewController(toWhatisGoal, animated: true )
    }
    
    // Activates the Current Goals ViewController.
    @IBAction func CurrentGoalsVC(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let toCurrentGoal = storyboard.instantiateViewController(withIdentifier: "CurrentGoalsViewController")as!CurrentGoalsViewController
        self.navigationController?.pushViewController(toCurrentGoal, animated: true)
    }
    
    // Takes the user to the table of goals created.
    @IBAction func toTableViewGoal(_ sender: Any) {
        self.performSegue(withIdentifier: "toTableViewGoalSegue", sender: self)
    }
}

