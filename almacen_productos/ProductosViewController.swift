import UIKit
import SwiftUI

class ProductosViewController: UIViewController {
    
    @IBOutlet var searchButton: UISearchBar!
    @IBOutlet var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // DISEÑO
        
        let contentView = ContentView()

        let hostingController = UIHostingController(rootView: contentView)

        addChild(hostingController)

        hostingController.view.frame = view.bounds
        hostingController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.insertSubview(hostingController.view, at: 0)

        hostingController.didMove(toParent: self)
        
        if let textField = searchButton.value(forKey: "searchField") as? UITextField {
            textField.backgroundColor = UIColor(hex: "#FFFFFF")
            textField.textColor = UIColor.black
            textField.layer.borderWidth = 0
            textField.layer.cornerRadius = 1
            textField.clipsToBounds = true
        }

        searchButton.backgroundImage = UIImage()
        searchButton.layer.backgroundColor = UIColor.clear.cgColor
        searchButton.layer.cornerRadius = 1
        searchButton.clipsToBounds = true
    }
    
    struct ContentView: View {
        var body: some View {
            ZStack {
                // Cambiar el degradado a horizontal
                LinearGradient(gradient: Gradient(colors: [
                    Color(red: 129/255, green: 169/255, blue: 203/255), // Color 1
                    Color(red: 63/255, green: 112/255, blue: 153/255)    // Color 2
                ]),
                startPoint: .leading, // Cambiado a .leading
                endPoint: .trailing) // Cambiado a .trailing
                .edgesIgnoringSafeArea(.all)
            }
        }
    }
}
