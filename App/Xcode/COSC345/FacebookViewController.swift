import UIKit
import WebKit

class FacebookViewController: UIViewController {
    @IBOutlet weak var webview: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // Actions to take on memory warning receieved
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Actions to take on view successully appearing
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let url = URL(string: "https://www.facebook.com/groups/2136889883304300/")!
        let request = URLRequest(url: url)
        webview.load(request)
    }
}
