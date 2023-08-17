//
//  Presenter.swift
//  Watchtower
//
//  Created by Pedro Sousa on 17/08/23.
//

import SwiftUI

protocol Presenter: Flow {
    associatedtype Sheets
    associatedtype Sheet: View

    @ViewBuilder func present(sheet: Sheets) -> Sheet
    func dismiss(sheet: Sheets)
}
