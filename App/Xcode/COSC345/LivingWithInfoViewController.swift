import UIKit
import WebKit

class LivingWithInfoViewController: UIViewController {

    @IBOutlet weak var webview: WKWebView!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let url = URL(string: "http://www.anxiety.org.nz")!
        let request = URLRequest(url: url)
        webview.load(request)
    }
}
