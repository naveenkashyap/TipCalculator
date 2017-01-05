# Pre-work - *Tipster*

**Tipster** is a tip calculator application for iOS.

Submitted by: **Naveen Kashyap**

Time spent: **8** hours spent in total

## User Stories

The following **required** functionality is complete:

* [X] User can enter a bill amount, choose a tip percentage, and see the tip and total values.
* [X] Settings page to change the default tip percentage.

The following **optional** features are implemented:
* [X] UI animations
* [X] Remembering the bill amount across app restarts (if <10mins)
* [X] Using locale-specific currency and currency thousands separators.
* [X] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.

The following **additional** features are implemented:

- [X] "Reset to Default" functionality on Settings page sets default tip to 15%
- [X] Views blur in as view appears and blur out as views dissapear
- [X] Elements (TextFields, Labels, etc.) slide between rest and active positions
- [X] Bill TextView enables clear functionality for quick edits

## Video Walkthrough 

Here's a walkthrough of implemented user stories:

<img src='http://i.imgur.com/FMnUCs7.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

Biggest challenge was learning that simply renaming an outlet for an element was not enough. I would need to reset the reference for the element to the newly named outlet.

## License

    Copyright 2017 Naveen Kashyap

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
