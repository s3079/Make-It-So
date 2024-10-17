//
//  Repositories+Injection.swift
//  MakeItSo
//
//  Created by Lee Lucci on 5/10/24.
//

import Foundation
import Factory


extension Container {
  public var remindersRepository: Factory<RemindersRepository> {
    self {
        RemindersRepository()
    }.singleton
  }
}
