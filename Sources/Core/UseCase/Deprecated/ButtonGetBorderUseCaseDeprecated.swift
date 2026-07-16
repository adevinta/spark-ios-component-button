//
//  ButtonGetBorderUseCaseDeprecated.swift
//  SparkComponentButton
//
//  Created by robin.lemaire on 23/06/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import Foundation
import SparkCommon
import SparkTheming

// sourcery: AutoMockable, AutoMockTest
protocol ButtonGetBorderUseCaseableDeprecated {
    // sourcery: border = "Identical"
    func execute(
        border: any Border,
        shape: ButtonShape,
        variant: ButtonVariant
    ) -> ButtonBorder
}

struct ButtonGetBorderUseCaseDeprecated: ButtonGetBorderUseCaseableDeprecated {

    // MARK: - Methods

    func execute(
        border: any Border,
        shape: ButtonShape,
        variant: ButtonVariant
    ) -> ButtonBorder {
        let width = (variant == .outlined) ? border.width.small : 0

        return .init(
            width: width,
            radius: border.radius.full
        )
    }
}
