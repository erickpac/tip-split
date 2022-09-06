# TIP SPLIT

The tip calculator app has features that allow fast bill entry
for those dining out with friends or family and have to split the
bill. You can calculate the exact percentage of tipping amount
from your total bill on the spot and get good service each time
you want service from the institution.

## Content

- [TIP SPLIT](#tip-split)
  - [Content](#content)
  - [Development Setup 🔨](#development-setup-)
  - [Design 🎨](#design-)
  - [Git Branching Strategy 🔀](#git-branching-strategy-)
    - [Feature Branches](#feature-branches)
    - [Develop Branch](#develop-branch)
    - [Milestone Branch](#milestone-branch)
    - [Main Branch](#main-branch)

## Development Setup 🔨

- [Xcode](https://apps.apple.com/us/app/xcode/id497799835)

## Design 🎨

- [Inspiration](https://dribbble.com/shots/17191118-Give-Tips-App)

## Git Branching Strategy 🔀

TIP SPLIT uses a feature/develop/milestone/main branching strategy. These different branches correlate to
various versions of the app in Vend that QA can request and test at different points of the
development process.

### Feature Branches

When developers begin work on a new feature or a bug, they will create a new branch off of the
`develop` branch to do the work on. Once the work is complete, they will open a pull request for
other developers to review. Once the code is reviewed and a tested on a device, the feature branch
will be merged back into the `develop` branch.

### Develop Branch

The develop branch holds the code for the active release being worked on. When code is merged into
this branch, new builds will be created for Vend.

These versions update multiple times a day. Jira tickets that were moved to QA the day prior should
be safe to test in the latest builds. Tickets moved sooner than that may still be in the queue to build.
Daily and sprint testing can be done using these Vend builds.

### Milestone Branch

When a release is ready for regression and smoke testing, code from the develop branch will be
merged into the milestone branch. The continuous integration system will generate both a version for
Vend that has the debug menu enabled, as well as release versions that will be uploaded to
TestFlight. These builds should be identical. Regression testing should be done primarily on the release versions in the various app stores except for anything that requires the debug menu.

### Main Branch

The main branch holds all code that has been released. Once a release is made public, code will be
merged into Main from Milestone and tagged with the release number. Any emergency fixes that need to
be made can be started by branching from Main with the tag of the release. The `main` branch does not create any Vend builds.
