//
//  ViewController.swift
//  Sign In with Apple
//
//  Created by 杨帆 on 2024/7/8.
//

import AuthenticationServices
import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        // 创建AuthorizationAppleIDButton
        let authorizationButton = ASAuthorizationAppleIDButton()
        authorizationButton.cornerRadius = 10
        authorizationButton.center = view.center
        authorizationButton.addTarget(self, action: #selector(handleAppleIdRequest), for: .touchUpInside)
        view.addSubview(authorizationButton)
        
        performExistingAccountSetupFlows()
    }

    // MARK: 按钮点击事件，请求授权
    @objc func handleAppleIdRequest() {
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.fullName, .email]
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.performRequests()
    }

    // MARK: 检查是否已经登录
    func performExistingAccountSetupFlows() {
        let requests = [ASAuthorizationAppleIDProvider().createRequest(), ASAuthorizationPasswordProvider().createRequest()]
        let authorizationController = ASAuthorizationController(authorizationRequests: requests)
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = self
        authorizationController.performRequests()
    }
}

extension ViewController: ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        view.window!
    }
}

// MARK: ASAuthorizationControllerDelegate
extension ViewController: ASAuthorizationControllerDelegate {
    // MARK: 授权成功
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
            let userIdentifier = appleIDCredential.user
            let fullName = appleIDCredential.fullName
            let email = appleIDCredential.email
            print("User id is \(userIdentifier) \n Full Name is \(String(describing: fullName)) \n Email id is \(String(describing: email))")
            // 检查用户凭据状态
            let appleIDProvider = ASAuthorizationAppleIDProvider()
            appleIDProvider.getCredentialState(forUserID: userIdentifier) { credentialState, error in
                switch credentialState {
                case .authorized:
                    print("The Apple ID credential is valid")
                case .revoked:
                    print("The Apple ID credential is revoked")
                case .notFound:
                    print("No credential was found")
                default:
                    break
                }
            }

        } else if let passwordCredential = authorization.credential as? ASPasswordCredential {
            let username = passwordCredential.user
            let password = passwordCredential.password
            present(UIViewController(), animated: true)
        }
    }

    // MARK: 授权失败
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print(error.localizedDescription)
    }
}

#Preview {
    ViewController()
}
