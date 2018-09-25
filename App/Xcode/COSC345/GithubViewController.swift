import UIKit
import WebKit

class GithubViewController: UIViewController {
    
    @IBOutlet weak var webview: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // Actions to take on Memory Warning received
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Actions to take on the view sucessfully appearing
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let url = URL(string: "https://github.com/RobertGiles/App")!
        let request = URLRequest(url: url)
        webview.load(request)
    }
}
