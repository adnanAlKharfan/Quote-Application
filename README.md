#Quote Application

This repository contains the source code for the InspoQuotes application, a freemium app designed to provide users with inspirational quotes. The app offers both free and premium quotes, with in-app purchases available for unlocking additional premium content.

## Table of Contents

- [Introduction](#Introduction)
- [Features](#Features)
- [Installation](#Installation)
- [Usage](#Usage)
- [Dependencies](#Dependencies)
- [Contributing](#Contributing)


## Introduction

InspoQuotes is a mobile application that delivers a daily dose of inspiration through a collection of motivational quotes. Users can enjoy a variety of free quotes and have the option to purchase premium quotes through in-app purchases.

## Features

- Daily Inspirational Quotes: Access a curated collection of motivational quotes.
- Freemium Model: Enjoy free quotes and unlock premium content with in-app purchases.
- Uses StoreKit Api for in-app purchases, restore purchase and detect failure in purchases.

## Installation

To set up the project on your local machine, follow these steps:

1. Clone the repository:

```sh
git clone https://github.com/adnanAlKharfan/Quote-Application.git
```

2. Navigate to the project directory:

```sh
cd Quote-Application
```

3. Open the project in Xcode:

```sh
open InspoQuotes.xcodeproj
```

4. Install dependencies using CocoaPods:

```sh
pod install
```

## Usage

1. Launch the app in Xcode:

    - Select the target device (e.g., iPhone simulator or connected device).
    - Click on the run button or press Cmd + R to build and run the app.

2. View Quotes:

    - Browse through the list of free quotes available in the app.

3. Purchase Premium Quotes:

    - Unlock additional quotes by making in-app purchases.

4. Restore Purchases:

    - Restore previously made purchases if the app is reinstalled.


## Dependencies

The project relies on the following dependencies:

  - StoreKit: A framework to handle in-app purchases and manage transactions.

These dependencies are managed using CocoaPods.

## Contributing

Contributions are welcome! Please fork this repository and submit a pull request.


