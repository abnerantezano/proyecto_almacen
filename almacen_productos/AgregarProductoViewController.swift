import UIKit

class AgregarProductoViewController: UIViewController {
    
    @IBOutlet var txtNombreProducto: UITextField!
    @IBOutlet var txtCategoriaProducto: UITextField!
    @IBOutlet var txtCantidadProducto: UITextField!
    @IBOutlet var txtPrecioProducto: UILabel!
    
    @IBOutlet var imageView: UIImageView!
    
    var anteriorVC = ViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    var cantidadV: Int = 0
    var precioV: Double = 0
    
    @IBAction func agregarProducto(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let producto = Producto(context: context)
        
        producto.nombre = txtNombreProducto.text
        producto.categoria = txtCategoriaProducto.text
        if let cantidadText = txtCantidadProducto.text, let cantidadV = Int16(cantidadText) {
            producto.cantidad = cantidadV
        }
        if let precioText = txtPrecioProducto.text, let precioV = Double(precioText) {
            producto.precio = precioV
        }
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        navigationController?.popViewController(animated: true)
        
    }
    
    
}
