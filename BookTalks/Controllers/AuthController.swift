import Foundation
import FirebaseAuth

class AuthController: ObservableObject {
    @Published var isLoggedIn: Bool = false

    func register(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            if error == nil {
                DispatchQueue.main.async {
                    self?.isLoggedIn = true
                }
            }
        }
    }

    func login(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] result, error in
            if error == nil {
                DispatchQueue.main.async {
                    self?.isLoggedIn = true
                }
            }
        }
    }

    func listenAuthState() {
        Auth.auth().addStateDidChangeListener { [weak self] _, user in
            DispatchQueue.main.async {
                self?.isLoggedIn = (user != nil)
            }
        }
    }
} 