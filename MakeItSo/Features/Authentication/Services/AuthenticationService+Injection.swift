//
//  AuthenticationService+Injection.swift
//  MakeItSo
//
//  Created by Admin on 15/10/24.
//

import Foundation
import Factory

extension Container {
  public var authenticationService: Factory<AuthenticationService> {
    self { AuthenticationService() }.singleton
  }
}
