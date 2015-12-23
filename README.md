#Tip Calculator

Tip Calculator is a tip calculator application for iOS.

Submitted by: Fernando A. Rodriguez Mac Lachlan

Time spent: 5 hours spent in total

## User Stories

The following **required** functionality is complete:
* [x] User can enter a bill amount, choose a tip percentage, and see the tip and total values.

The following **optional** features are implemented:
* [x] Settings page to change the default tip percentage.
* [ ] UI animations
* [x] Remembering the bill amount across app restarts (if <10mins)
* [x] Using locale-specific currency and currency thousands separators.
* [x] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.

The following **additional** features are implemented:

- [x] activity monitor for saving method to give user feedback that settings where saved in view controller

## Video Walkthrough 

Here's a walkthrough of implemented user stories:


<a href="http://imgur.com/ZLbBOiu"><img src="http://i.imgur.com/ZLbBOiu.gif" title="Tip Calculator video walk Throuhg" /></a>

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes
Some of the challenges i encountered was storing valus in NSUserDefaults as well as updating values 
based on the stored NSUserDefaults. Also there was some trouble remembering what the user had done in views and keeping 
as it was across view changes. 


## License

    Copyright 2015 Fernando Rodriguez

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
