//
//  CreateAccountViewController.swift
//  demoTeamEventsApp
//
//  Created by Andrea Hernandez on 2/13/24.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore


class CreateAccountViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var viewCreateAccount: UIView!
    @IBOutlet weak var userNameTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    var originalViewFrame: CGRect?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewCreateAccount.layer.cornerRadius = 16 // Puedes ajustar este valor según lo desees
        
        
        // Configurar los delegados de los campos de texto
        userNameTxt.delegate = self
        emailTxt.delegate = self
        passwordTextField.delegate = self
        
        // Guardar la posición original de la vista
        originalViewFrame = viewCreateAccount.frame
        
        // Agregar observadores para las notificaciones de teclado
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    //Método que se llama cuando el teclado aparece
    @objc func keyboardWillShow(_ notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            _ = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
            self.viewCreateAccount.frame = CGRect(x: originalViewFrame!.origin.x, y: originalViewFrame!.origin.y, width: originalViewFrame!.width, height: originalViewFrame!.height - keyboardSize.height)
            
            
        }
    }
    // Método que se llama cuando el teclado se oculta
    @objc func keyboardWillHide(_ notification: Notification) {
        self.viewCreateAccount.frame = originalViewFrame!
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
    
    @IBAction func signUpButtonPressed(_ sender: Any) {
        
        // Verificar si todos los campos están llenos y en el formato deseado
        guard let userName = userNameTxt.text, !userName.isEmpty else {
            showAlert(message: "Por favor, ingresa un nombre de usuario.")
            return
        }
        
        guard let email = emailTxt.text, !email.isEmpty else {
            showAlert(message: "Por favor, ingresa un correo electrónico.")
            return
        }
        
        guard let password = passwordTextField.text, !password.isEmpty else {
            showAlert(message: "Por favor, ingresa una contraseña.")
            return
        }
        
        guard password.count >= 6 else {
            showAlert(message: "La contraseña debe tener al menos 6 caracteres.")
            return
        }
        
        // Verificar si el formato del correo electrónico es válido
        guard isValidEmail(email) else {
            showAlert(message: "Por favor, ingresa un correo electrónico válido.")
            return
        }
        
        // Registrar al usuario en Firebase
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                self.showAlert(message: "Error al registrar al usuario: \(error.localizedDescription)")
            } else {
                // El usuario se registró exitosamente
                // Puedes agregar aquí cualquier lógica adicional que necesites después del registro
                let firestore = Firestore.firestore()
                
                let userDictionary = ["email " : self.emailTxt.text!, "username" : self.userNameTxt.text!] as! [String : Any]
                
                firestore.collection("UserInfo").addDocument(data: userDictionary) { error in
                    if error != nil {
                        
                    }
                }
                // Navegar a la siguiente vista
                let storyboard = UIStoryboard(name: "TableEvents", bundle: nil)
                let newViewController = storyboard.instantiateViewController(withIdentifier: "TabBarStoryboard")
                self.navigationController?.pushViewController(newViewController, animated: true)
            }
        }
    }
    
    // Función para verificar si el formato de un correo electrónico es válido
    func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    
    func showAlert(message: String) {
        let alertController = UIAlertController(title: "Alerta", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}
