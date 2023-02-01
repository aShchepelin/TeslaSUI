//
//  Constants.swift
//  SUI
//
//  Created by Александр Андреевич Щепелин on 30.01.2023.
//

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
        static let kilometers = "187 km"
        static let climateScreenName = "CLIMATE"
        static let ac = "Ac"
        static let fan = "Fan"
        static let heat = "Heat"
        static let auto = "Auto"
        static let climateSettings = "Climate settings"
        static let acIsOn = "A/C is ON"
        static let turnOnButtonText = "Tap to turn off or swipe up for a fast setup"
        static let colorText = "Color"
        static let ventText = "Vent"
        static let hiText = "Hi"
        static let welcomeText = "Welcome back"
        static let teslaSupportLink = "https://www.tesla.com/support"
        static let closeButtonLabel = "Close"
    }
    
    /// Цифровые значения
    enum Integer {
        static let sliderRange: ClosedRange<Double> = 0...15
    }
}
