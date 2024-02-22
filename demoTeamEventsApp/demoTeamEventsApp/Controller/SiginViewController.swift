//
//  SiginViewController.swift
//  demoTeamEventsApp
//
//  Created by Andrea Hernandez on 2/13/24.
//

import UIKit
import FirebaseCore
import FirebaseAuth
import FirebaseFirestore

class SiginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var viewSignIn: UIView!
    @IBOutlet weak var emailUserNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var originalViewFrame: CGRect?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewSignIn.layer.cornerRadius = 16 // Puedes ajustar este valor según lo desees
        //        viewSignIn.clipsToBounds = true // Esto es importante para que los contenidos del view no se salgan de los bordes redondeados
        
        
        
        // Configurar los delegados de los campos de texto
        emailUserNameTextField.delegate = self
        passwordTextField.delegate = self
        
        // Guardar la posición original de la vista
        originalViewFrame = viewSignIn.frame
        
        // Agregar observadores para las notificaciones de teclado
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    //Método que se llama cuando el teclado aparece
    @objc func keyboardWillShow(_ notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            _ = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
            self.viewSignIn.frame = CGRect(x: originalViewFrame!.origin.x, y: originalViewFrame!.origin.y, width: originalViewFrame!.width, height: originalViewFrame!.height - keyboardSize.height)
            
            //            var aRect = self.view.frame
            //            aRect.size.height -= keyboardSize.height
            //            if !aRect.contains(passwordTextField.frame.origin) {
            //                self.viewSignIn.frame.origin.y -= keyboardSize.height
            //            }
        }
    }
    
    // Método que se llama cuando el teclado se oculta
    @objc func keyboardWillHide(_ notification: Notification) {
        self.viewSignIn.frame = originalViewFrame!
    }
    
    // Método para cerrar el teclado al presionar la tecla de retorno
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    deinit {
        // Eliminar los observadores de las notificaciones de teclado
        NotificationCenter.default.removeObserver(self)
    }
    
    @IBAction func signInButtonPressed(_ sender: Any) {
        
        // Verificar si todos los campos están llenos
        guard let usernameOrEmail = emailUserNameTextField.text, !usernameOrEmail.isEmpty else {
            showAlert(message: "Please enter your email.")
            return
        }
        
        guard let password = passwordTextField.text, !password.isEmpty else {
            showAlert(message: "Please enter your password.")
            return
        }
        
        // Verificar si el campo contiene un formato de correo electrónico válido
        if isValidEmail(usernameOrEmail) {
            // El usuario ingresó un correo electrónico, iniciar sesión con el correo electrónico
            Auth.auth().signIn(withEmail: usernameOrEmail, password: password) { [weak self] authResult, error in
                guard let strongSelf = self else { return }
                
                if let error = error {
                    //strongSelf.showAlert(message: "Error al iniciar sesión: \(error.localizedDescription)")
                    self?.showAlert(message: "Password or Email incorrect")
                } else {
                    // Inicio de sesión exitoso
                    // Aquí puedes realizar cualquier lógica adicional que necesites después del inicio de sesión
                    
                    // Navegar a la siguiente vista
                    let storyboard = UIStoryboard(name: "TableEvents", bundle: nil)
                    let newViewController = storyboard.instantiateViewController(withIdentifier: "TabBarStoryboard")
                    strongSelf.navigationController?.pushViewController(newViewController, animated: true)
                    
                }
            }
//        } else {
//            let firestore = Firestore.firestore()
//            firestore.collection("UserInfo").whereField("username", isEqualTo: usernameOrEmail).getDocuments { [weak self] (snapshot, error) in
//                guard let strongSelf = self else { return }
//                
//                if let error = error {
//                    // Manejar el error
//                    strongSelf.showAlert(message: "Error al iniciar sesión: \(error.localizedDescription)")
//                } else {
//                    guard let documents = snapshot?.documents, !documents.isEmpty else {
//                        strongSelf.showAlert(message: "El nombre de usuario no existe.")
//                        return
//                    }
//                    
//                    // Suponiendo que el primer documento es el usuario con el nombre de usuario ingresado
//                    let document = documents[0]
//                    let userData = document.data()
//                    
//                    // Verificar si la contraseña ingresada coincide con la contraseña almacenada en la base de datos
//                    guard let storedPassword = userData["password"] as? String, storedPassword == password else {
//                        strongSelf.showAlert(message: "La contraseña es incorrecta.")
//                        return
//                    }
//                    
//                    // Inicio de sesión exitoso
//                    // Aquí puedes realizar cualquier lógica adicional que necesites después del inicio de sesión
//                    
//                    // Navegar a la siguiente vista
//                    let storyboard = UIStoryboard(name: "TableEvents", bundle: nil)
//                    let newViewController = storyboard.instantiateViewController(withIdentifier: "TabBarStoryboard")
//                    strongSelf.navigationController?.pushViewController(newViewController, animated: true)
//                }
//            }
//        }
        } else {
            // Manejar el caso de que el usuario ingresó un nombre de usuario
            // Puedes mostrar un mensaje de error o cualquier otra lógica que desees
            showAlert(message: "Please enter a valid email")
        }
    }
    
    // Función para verificar si el formato de un correo electrónico es válido
    func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    
    // Función para mostrar una alerta con un mensaje dado
    func showAlert(message: String) {
        let alertController = UIAlertController(title: "Alerta", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}
