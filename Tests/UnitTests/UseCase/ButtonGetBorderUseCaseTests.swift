//
//  ButtonGetBorderUseCaseTests.swift
//  SparkComponentButtonTests
//
//  Created by robin.lemaire on 11/03/2026.
//  Copyright © 2026 Leboncoin. All rights reserved.
//

@testable import SparkComponentButton
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonTesting
@_spi(SI_SPI) import SparkThemingTesting
import Testing

@Suite("Button Get Border Use Case Tests")
struct ButtonGetBorderUseCaseTests {

    // MARK: - Properties

    let sut: ButtonGetBorderUseCase

    let theme: ThemeGeneratedMock

    // MARK: - Initialization

    init() {
        self.theme = .mocked()
        self.sut = ButtonGetBorderUseCase()
    }

    // MARK: - Tests

    @Test("Variant contrast with styles and pill shape")
    func variantContrastWithStylesAndPillShape() throws {
        // GIVEN / WHEN
        let border = self.sut.execute(
            theme: self.theme,
            shape: .pill,
            variant: .contrast,
            removeStyles: false
        )

        // THEN
        let expectedBorder = ButtonBorder(
            width: 0,
            radius: self.theme.border.radius.full
        )

        #expect(border == expectedBorder)
    }

    @Test("Variant filled with styles and pill shape")
    func variantFilledWithStylesAndPillShape() throws {
        // GIVEN / WHEN
        let border = self.sut.execute(
            theme: self.theme,
            shape: .pill,
            variant: .filled,
            removeStyles: false
        )

        // THEN
        let expectedBorder = ButtonBorder(
            width: 0,
            radius: self.theme.border.radius.full
        )

        #expect(border == expectedBorder)
    }

    @Test("Variant ghost with styles and pill shape")
    func variantGhostWithStylesAndPillShape() throws {
        // GIVEN / WHEN
        let border = self.sut.execute(
            theme: self.theme,
            shape: .pill,
            variant: .ghost,
            removeStyles: false
        )

        // THEN
        let expectedBorder = ButtonBorder(
            width: 0,
            radius: self.theme.border.radius.full
        )

        #expect(border == expectedBorder)
    }

    @Test("Variant outlined with styles and pill shape")
    func variantOutlinedWithStylesAndPillShape() throws {
        // GIVEN / WHEN
        let border = self.sut.execute(
            theme: self.theme,
            shape: .pill,
            variant: .outlined,
            removeStyles: false
        )

        // THEN
        let expectedBorder = ButtonBorder(
            width: self.theme.border.width.small,
            radius: self.theme.border.radius.full
        )

        #expect(border == expectedBorder)
    }

    @Test("Variant tinted with styles and pill shape")
    func variantTintedWithStylesAndPillShape() throws {
        // GIVEN / WHEN
        let border = self.sut.execute(
            theme: self.theme,
            shape: .pill,
            variant: .tinted,
            removeStyles: false
        )

        // THEN
        let expectedBorder = ButtonBorder(
            width: 0,
            radius: self.theme.border.radius.full
        )

        #expect(border == expectedBorder)
    }

    @Test("Remove styles returns empty border")
    func removeStylesReturnsEmptyBorder() throws {
        // GIVEN / WHEN
        let border = self.sut.execute(
            theme: self.theme,
            shape: .pill,
            variant: .outlined,
            removeStyles: true
        )

        // THEN
        let expectedBorder = ButtonBorder()

        #expect(border == expectedBorder)
    }

    @Test("Remove styles ignores variant")
    func removeStylesIgnoresVariant() throws {
        // GIVEN / WHEN
        let borderOutlined = self.sut.execute(
            theme: self.theme,
            shape: .pill,
            variant: .outlined,
            removeStyles: true
        )

        let borderFilled = self.sut.execute(
            theme: self.theme,
            shape: .pill,
            variant: .filled,
            removeStyles: true
        )

        // THEN
        #expect(borderOutlined == borderFilled)
        #expect(borderOutlined.width == 0)
        #expect(borderOutlined.radius == 0)
    }

    // MARK: - Shape Tests

    @Test("All shapes return full radius")
    func allShapesReturnFullRadius() throws {
        // GIVEN / WHEN
        let borderSquare = self.sut.execute(
            theme: self.theme,
            shape: .square,
            variant: .filled,
            removeStyles: false
        )

        let borderRounded = self.sut.execute(
            theme: self.theme,
            shape: .rounded,
            variant: .filled,
            removeStyles: false
        )

        let borderPill = self.sut.execute(
            theme: self.theme,
            shape: .pill,
            variant: .filled,
            removeStyles: false
        )

        // THEN
        #expect(borderSquare.radius == self.theme.border.radius.full)
        #expect(borderRounded.radius == self.theme.border.radius.full)
        #expect(borderPill.radius == self.theme.border.radius.full)
        #expect(borderSquare.width == 0)
        #expect(borderRounded.width == 0)
        #expect(borderPill.width == 0)
    }

    // MARK: - Combined Tests

    @Test("Outlined variant returns full radius with border for all shapes")
    func outlinedVariantReturnsFullRadiusWithBorderForAllShapes() throws {
        // GIVEN / WHEN
        let borderSquare = self.sut.execute(
            theme: self.theme,
            shape: .square,
            variant: .outlined,
            removeStyles: false
        )

        let borderRounded = self.sut.execute(
            theme: self.theme,
            shape: .rounded,
            variant: .outlined,
            removeStyles: false
        )

        let borderPill = self.sut.execute(
            theme: self.theme,
            shape: .pill,
            variant: .outlined,
            removeStyles: false
        )

        // THEN
        #expect(borderSquare.radius == self.theme.border.radius.full)
        #expect(borderRounded.radius == self.theme.border.radius.full)
        #expect(borderPill.radius == self.theme.border.radius.full)
        #expect(borderSquare.width == self.theme.border.width.small)
        #expect(borderRounded.width == self.theme.border.width.small)
        #expect(borderPill.width == self.theme.border.width.small)
    }
}
