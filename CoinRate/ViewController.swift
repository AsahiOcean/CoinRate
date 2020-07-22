import UIKit
import SwiftyJSON
import Alamofire

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var array = [[String]()]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AF.request("https://blockchain.info/ru/ticker").responseJSON { response in
            let json = try! JSON(data: response.data!)
        }
    }
}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        return cell
    }
}
