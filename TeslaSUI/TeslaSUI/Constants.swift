// Constants.swift
// Copyright © RoadMap. All rights reserved.

/// Константы
enum Constants {
    /// Имена картинок
    enum Images {
        static let lockClosedImageName = "lock.fill"
        static let lockOpenImageName = "lock.open.fill"
        static let teslaOpenImageName = "teslaOpen"
        static let teslaMainImageName = "teslaMain"
        static let gearshapeImageName = "gearshapeIcon"
        static let teslaLockedImageName = "teslaLocked"
        static let teslaUnlockedImageName = "teslaUnlocked"
        static let backChevronImageName = "backChevron"
        static let snowIconImageName = "snowIcon"
        static let heatIconImageName = "heatIcon"
        static let fanIconImageName = "fanIcon"
        static let autoIconImageName = "autoIcon"
        static let powerIconImageName = "powerIcon"
        static let chevronLeftImageName = "chevron.left"
        static let chevronRightImageName = "chevron.right"
        static let carDoorImageName = "carDoor"
        static let linkImageName = "link"
    }
    
    /// Текст лейблов
    enum Text {
        static let openText = "Unlock"
        static let closedText = "Lock"
        static let teslaText = "Tesla"
        static let kilometersText = "187 km"
        static let climateScreenName = "CLIMATE"
        static let acText = "Ac"
        static let fanText = "Fan"
        static let heatText = "Heat"
        static let autoText = "Auto"
        static let climateSettingsText = "Climate settings"
        static let acIsOnText = "A/C is ON"
        static let turnOnButtonText = "Tap to turn off or swipe up for a fast setup"
        static let colorText = "Color"
        static let ventText = "Vent"
        static let hiText = "Hi"
        static let welcomeText = "Welcome back"
        static let teslaSupportLink = "https://www.tesla.com/support"
        static let closeButtonLabel = "Close"
        static let celsiusText = "° C"
    }
    
    /// Цифровые значения
    enum Integer {
        static let sliderRange: ClosedRange<Double> = 0...15
    }
}
