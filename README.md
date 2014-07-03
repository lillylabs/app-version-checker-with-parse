## Usage

To run the example project; clone the repo, and run `pod install` from the Project directory first.

## Installation

LAAppVersionCheckerWithParse is available through [LillyCocoaPods](https://bitbucket.org/lillyapps/lilly-cocoa-pods), to install
it simply add the following line to your Podfile:

    pod "LAAppVersionCheckerWithParse"

## Release

To release a new version of the pod use the command from the master branch:

    rake release
    
This will update push to the remote repo and create a new tag, then it will push the Podspec to [LillyCocoaPods](https://bitbucket.org/lillyapps/lilly-cocoa-pods). 

Requires that you have called the Specs Repo *LillyCocoaPods* on your machine. Check your Specs Repo name by using this command:

    ls ~/.cocoapods/repos/

## Localization

Open Finder and go to the Pods root folder. There is a generated localization file located here:

    LAAppVersionCheckerWithParse/Resources/LAAppVersionCheckerWithParse-Localizable.strings

You may copy this into your main project and customize the texts there.

## Parse.com requirements

Create a class named ``AppVersion`` with the columns ``version`` and ``required``.