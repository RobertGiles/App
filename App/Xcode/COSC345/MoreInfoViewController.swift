import UIKit
import WebKit

class MoreInfoViewController: UIViewController {
    @IBOutlet weak var webview: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // Actions to take on a memory warnin being received
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Actions to take on the view successfullly appearing
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let url = URL(string: "https://www.healthnavigator.org.nz/health-a-z/s/social-phobia/")!
        let request = URLRequest(url: url)
        webview.load(request)
    }
}
