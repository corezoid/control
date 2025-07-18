# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [5.122.0] - 2025-07-16
### Application Versions
- **server**: 5.122.0
- **frontend**: 5.122.0
- **realtime**: 3.5.0
- **control-tasks**: 2.56.0
- **widget**: v1.62.0
### 🧠 AI Console, Actors & Automation
1. Integrated AI Prompt Node call via the "Add Content" button with feature highlighting
2. Enabled AI Actor creation via the "Add Content" button
3. Added API method for balance transfer between actors
4. Added support for Valence Actor Bag Layer rendering
5. Removed all front-end references to `GET /layers_links/vertical_links/:accId`
6. Assigned coordinates to actors in Parent Valency Graphs
7. Added tooltip for "AI Console" sidebar menu item
8. Renamed sidebar item and updated icon for AI Console
9. Preserved drawing and prevented unintended elements during actor renaming
10. Changed actor's short menu
11. Created endpoint for prefilled actor form (prompt node) [back-end]
12. Investigated `updated_at` field zero values in `actors_accounts` table
### 💬 Communication, Calls & Chat
1. Fullscreen view of the last shared screen in Mobile Call Simulator
2. Added "Participants" tab during active event calls
3. Fixed duplicate `sipCall` sent from Web Chat
4. Fixed incorrect chat list in the "All" section
5. Fixed HTML-escaped special characters in widget chat messages
6. Fixed error: `userId` must be a number when leaving a call
7. Improved UX for actor creation via link button
### 🛠️ UI/UX Improvements
1. Auto-opening of Details panel when changing connection type
2. Notification sync across browser tabs
3. Improved UI logic and text behavior in meeting settings
4. Fixed misaligned text editing area in block diagram
5. Fixed textfield not resizing with the block
6. Fixed quote text display during actor renaming
7. Adjusted icon colors across the UI
8. Fixed unread message counter disappearing after editing
9. Fixed focus jump between topic-select and events widget
10. Added hover highlighting for icons
11. Removed duplicate grouping elements in block diagram list
12. Fixed UI freezing after switching between events
13. Filled empty grid slots in odd-numbered layouts
### 🔔 Notifications
1. Implemented front-end for notifications management
2. [server] Excluded system/API users from realtime notifications
### 📦 Backend & Infrastructure
1. Performed video compression without changing video format
2. Created endpoint for prefilled actor prompt form
3. Enabled backend logic for live meeting recording
### 🐞 Critical Bug Fixes
1. Fixed bulk file download issue
2. Fixed infinite preloader when opening multi-layer actor
3. [Prod] Fixed error: `params/userId must be number` when leaving a call
4. [Prod] Fixed error: `Cannot read properties of undefined (reading 'getEdgeMidpoint')` when switching layers in graph

## [5.119.0] - 2025-06-25
- Application Versions:
  - server - 5.119.2
  - frontend - 5.119.0
  - realtime - 3.4.2
  - control-tasks - 2.56.0
  - widget - v1.61.0

### 🧠 Functional Enhancements
1. Integrated AI Prompt Node Call via Add Content and highlighted available features
2. Enabled quoting in transcripts
3. Enabled split screen sharing mode with auto-collapse
4. Enabled exclusive mode switching in Graph Editor
5. Added support for "center" alignment in Simulator embed widget
6. Enabled link opening from external sources via mobile Simulator
7. Implemented block-specific forms (front-end and back-end)
8. Extended call reaction functionality to support reactions for specific users (front-end)
9. Added negative reactions for entire call and transaction processing
10. Enhanced comment creation API with immediate attachment support

### 🛠 Fixes
1. Redirected to the Meeting Tab after accepting a P2P call
2. Fixed incorrect chat navigation from the bell icon 🔔
3. Ensured shared screen remains visible after tab switch in a call
4. Fixed data display issue on dashboards for the last day
5. Investigated and resolved DataCloneError when embedding call via iframe
6. Fixed periodic freezing during screen sharing in calls
7. Fixed incorrect display of last reaction time in Simulator chat list
8. Fixed incorrect behavior of quote in the description field
9. Prevented text selection reset in read-only event description
10. Fixed incorrect active state display in the Chats section
11. Fixed issue with disappearing unread messages list
12. Fixed missing attached files in chat list header
13. Fixed Smart Forms autocomplete clearing initial value on first click
14. Fixed chip behavior in comments
15. Fixed incorrect multilayer behavior on the graph
16. Fixed incorrect event list display in Events section
17. Fixed missing notifications for upcoming calls when a previous call was still active
18. Fixed unread counter not resetting after message is read
19. Fixed chat scroll jumping to top on switch
20. Corrected unread message counter colors in active chat
21. Fixed HTML rendering of chips in chat previews

### 🎨 UI/UX Improvements
1. Centered shared screen when zooming with touchpad
2. Highlighted active filters in UI
3. Displayed correct UI message when currencies are unavailable in Simulator accounts
4. Renamed "Actors bag" label to "Actor Bag" across Simulator interface
5. Redesigned the right panel in the Chats section
6. Added unread chat counters in the sidebar
7. Updated browser tab titles in Simulator to show "Chats" for P2P chats

### 🧩 Graph / Flowchart / Editor Enhancements
1. Added all Corezoid nodes to the Simulator flowchart editor
2. Grouped blocks in the flowchart editor menu
3. Assigned coordinates to actors on parent valency graphs (front-end)
4. Assigned coordinates to actors on parent valency graphs
5. Assigned coordinates to actors in the Actor Bag Graph
6. Implemented flowchart actor numbering
7. Preserved flowchart structure and links when copying to another graph
8. Refactored graph layer list (System vs Custom)
9. Handled errors when creating actors on the graph (undefined ID)
10. Added new blocks systematically to algorithm editor via API

### 🔧 Backend / Infrastructure
1. Implemented back-end logic for notification management
2. Added start_date and end_date fields to the actors table in control-tasks service
3. Optimized PostgreSQL master-slave architecture via API

### 🧼 Minor Behavior Changes
1. Suppressed system connection status messages in fullscreen Smart Forms
2. Synchronized call notifications across browser tabs
3. Synced live meetings with updates from other real-time events
4. Prevented group chat creation without required fields
5. Ensured transfer is visible without requiring graph refresh
6. Fixed skipSubmitOnChange behavior when value was unchanged
7. Prevented long form reference from overlapping the Owner field

## [0.3.53] - 2025-06-04
- Application Versions:
  - server - 5.116.7
  - frontend - 5.116.0
  - realtime - 3.2.0
  - control-tasks - 2.54.0
  - widget - v1.60.0

### 🏗️ Actor Accounts & Initialization
1. Automatically open all system accounts upon actor creation
2. Create time accounts - backend
3. Auto-transactions for new actors – Time Coordinates Accounts
4. Transactions to existing actors — Time Coordinates Accounts
5. Add time coordinates to actor - front-end
6. Account initialization for USER actors
7. Create coordinates accounts for all actors

### 🧩 Simulator Enhancements
1. Add freeze event handling in Simulator chat widget
2. Implementing commenting in transcription chat
3. Search through comments in P2P chats in Simulator
4. Unify default event tab behavior in Mobile Simulator
5. The logic of creating flowchart actors and edges through a plus on the actor
6. Add default color selection for flowchart actors
7. Enable line break in Flowchart Block Actor on Enter press

### 📊 Graphs & UI Updates
1. Update modal title text for graph renaming
2. Dashboards: minutes in end date do not match in Line chart display
3. Standalone meeting room URL for Smart Forms

### 💬 Communication & SIP
1. Control initial camera and microphone state in widget (type: twilio)
2. Audio and video settings not saved in SIP calls

### 🛠️ Miscellaneous Improvements
1. Implement folder creation via confirmation
2. Implement quoting functionality for comment fragments
3. Optimize GET /graph/links/:actorId endpoint
4. Optimize stream live view counter retrieval

## [0.3.52] - 2025-05-28
### Helm changes
- Applications versions:
  - server - 5.115.1
  - frontend - 5.115.0
  - realtime - 3.2.0
  - control-tasks - 2.53.1
  - widget - v1.59.0

### Added
- Added Apple App Site Association support to frontend subchart with configurable content
- Added AOS Association support to frontend subchart with configurable content
- Added Grafana alert rules for pong-server metrics
- Added comprehensive alert rules for HTTP requests, database performance, Redis connections, API Gateway, webhooks, system resources, and business processes
- Added Grafana alert rules for control-tasks metrics
- Added GitLab saver configuration to control-tasks for saving graph data to GitLab repositories

### 📊 Analytics & Graphs
#### 1. Added drawings to the graph
#### 2. Implemented support for multiple links between actors
#### 3. Enhanced linking for expanded actors
#### 4. Implemented custom period selection in dashboard settings
#### 5. Implemented dynamic trend line for accounts on dashboards
#### 6. Updated default date and time logic during event creation
#### 7. Added support for rolling back actor version
#### 8. Improved statistics for layer edges
#### 9. Improved tooltip placement on graphs
#### 10. Implemented graph file export to Git
#### 11. Implemented structuring of layer actor accounts
#### 12. Added system accounts for graph actors
#### 13. Implemented screen sharing radar

### 🧩 Simulator & Widget
#### 1. Added tooltips to menu buttons in the events description section
#### 2. Improved file preview behavior in Simulator widget
#### 3. Optimized script preloading in chat widget
#### 4. Enabled adding images from clipboard into the chat widget
#### 5. Unified BBCode rendering between Simulator and Admin
#### 6. Added "Minimize Chat" button to the widget
#### 7. Fixed scroll-to-bottom button in chat widget
#### 8. Fixed Simulator chat losing user access after state or actor changes
#### 9. Improved state alignment and coordinate accuracy on graph
#### 10. Fixed text actor not copying using lasso
#### 11. Implemented support for AWS transcribe in meet-agent
#### 12. Improved Simulator zoom scaling during screen sharing
#### 13. Implemented support for multiple edges between two actors
#### 14. Added fullscreen mode for expanded layer
#### 15. Implemented chat interactions in front-end

### 💬 SIP / Calls
#### 1. Added support for reactions (emojis)
#### 2. Fixed SIP screen showing wrong profile on collapsed sharing
#### 3. Fixed SIP callback handling across tabs
#### 4. Improved switching between video call modes during screen sharing
#### 5. Added ability to remove Redis KEYS command
#### 6. Added detection for connected_from = mobile in participants
#### 7. Fixed issue with duplicated emoji reactions on shared screen
#### 8. Enabled bidirectional navigation between event description and comments
#### 9. Fixed SIP issue with empty screen after stopping sharing

### 🛠 UI/UX Improvements
#### 1. Added drag & drop support for widgets
#### 2. Added tooltips to event section buttons
#### 3. Removed star icon from table headers for better UX
#### 4. Added empty state indicator in graphs section
#### 5. Improved dropdown alignment relative to input fields
#### 6. Fixed multilayer window jumps on graphs
#### 7. Synchronized automatic dashboard resize on graphs
#### 8. Fixed actor color change issue on dashboard refresh
#### 9. Improved error handling when Redis cluster fails
#### 10. Fixed tooltip overlapping sound icon
#### 11. Fixed issues with shared graph not opening from Event tab

### 🐞 Bug Fixes
#### 1. Fixed actor owner losing access after moving actor/state
#### 2. Fixed actor button visibility only at the bottom of dashboard element
#### 3. Fixed events not showing when navigating PDF with arrows
#### 4. Fixed incorrect total display on dashboard for custom date range
#### 5. Fixed tag search with backspace in event/reactions
#### 6. Fixed Safari issue: blue highlight not disappearing on new message
#### 7. Fixed inability to create new link when multiple already exist
#### 8. Fixed quote breaks when referencing code blocks
#### 9. Fixed error on dashboard actor graph not showing

### 🧪 API & System
#### 1. Updated API method DELETE for attachments/files
#### 2. Implemented nginx config isolation to fix POST routing issue
#### 3. Enabled readonly mode for actor or form via API
#### 4. Enabled real-time transactions based on actor and state valency
#### 5. Split livestream into internal tabs for meetings/rooms
#### 6. Supported multiple hosts (moderators) during a call

## [0.3.50] - 2025-05-15
### Helm changes
- Applications versions:
  - server - 5.110.4
  - frontend - 5.110.1
  - realtime - 3.3.3
  - control-tasks - 2.52.4
  - widget - v1.57.0
- Added ability to configure Redis pool settings (max, idle, min) for server and realtime components through global values.yaml
- Added support for Redis Cluster mode in server, realtime, and control-tasks components

## [0.3.49] - 2025-04-23
### Helm changes
- Applications versions:
  - server - 5.110.3
  - frontend - 5.110.1
  - realtime - 3.2.0
  - control-tasks - 2.52.0
  - widget - v1.57.0
- Added ScyllaDB cleaner configuration to control-tasks for automatic database maintenance

### Improvements / New Features

#### 1. Added text support in graphs and improved actor selection.
#### 2. Voice playback for events and comments (Text-to-Speech).
#### 3. Real-time call transcription.
#### 4. Ability to preview TXT files directly in Simulator.
#### 5. Added description field to form settings and improved event metadata editing.
#### 6. Carousel scrolling and keyboard navigation enhancements in graph scripts and snippets.
#### 7. Push notifications supported (including Firebase).
#### 8. New event description copying and fullscreen script display.
#### 9. Cross-domain file download support.
#### 10. Dynamic transcription language selection in Meet-agent.

### UI/UX Improvements

#### 1. Redesigned UI for Actor Bag, Graphs, and Events.
#### 2. Improved emoji rendering and modal UI visuals.
#### 3. Optimized background effects and removed video mirroring during calls.
#### 4. Updated actor drag logic and improved scroll experience in large transcriptions.
#### 5. Enhanced mobile UI for device selection and custom bar interactions.

### Behavior & Performance Upgrades

#### 1. Better control over callback/notification behavior during calls.
#### 2. Accurate dashboard filtering and improved stream stability.
#### 3. Event widgets and actor avatars display more reliably.
#### 4. Optimized workspace synchronization and dashboard updates.

### Bug Fixes

#### 1. Fixed issues with chat scroll, transcription visibility, and emoji display.
#### 2. Resolved graph load errors, broken links, and actor filtering bugs.
#### 3. Corrected visual glitches in volume popups and form field errors.
#### 4. Addressed sorting inconsistencies in streams and improved event title updates.



## [0.3.49] - 2025-04-02
### Helm changes
- Applications versions:
  - server - 5.XXX.X
  - frontend - 5.XXX.X
  - realtime - 3.2.0
  - control-tasks - 2.XX.X
  - widget - v1.XX.X
- Fix rbac for `realtime`
- Fix "Internal IP Address Disclosure" vulnerability by filtering internal IP addresses in X-Real-IP header
- Update `realtime` config - implement `ScyllaDB` support.
- Update `main` and `redis` dashbords.
- Add `actors_cleaner` configuration to `control-tasks` subchart.


## [0.3.48] - 2025-03-12
### Helm changes
- Applications versions:
  - server - 5.104.0
  - frontend - 5.104.0
  - realtime - 3.1.0
  - control-tasks - 2.49.0
  - widget - v1.53.0

### Improvements / New Features

#### 1. Expanded functionality for sound management.
#### 2. Implemented cross cursor function.
#### 3. Enabled selection of cell sets and actor insertion into the selected area.
#### 4. Added prompt for participants to enable the microphone in an active call.
#### 5. Added a meeting flag for automatic notifications and callbacks.
#### 6. Implemented file upload progress tracking.
#### 7. Added the "Graph" tab to the event.
#### 8. Implemented forced room closure, mute/unmute users, and moderator management.
#### 9. Added popup for mute/unmute users and moderator management.
#### 10. Adjusted UI for actor creation on first entry and fullscreen mode.
#### 11. Expanded meeting functionality by adding comments.
#### 12. Enabled overriding the operator's name displayed to the client in the chat widget.
#### 13. Enhanced graph interaction mechanics.
#### 14. Fixed incorrect inheritance of forms and accounts in Graph/Layer/State.
#### 15. Implemented call recording management.
#### 16. Created an AI agent actor with customization capabilities within each workspace.
#### 17. Enhanced line dashboard metrics display.
#### 18. Added zooming capability for expanded sharing in calls.
#### 19. Adjusted display behavior when expanding a user in a call.
#### 20. Fixed border shift during move or zoom.
#### 21. Fixed callback synchronization across tabs when creating a regular meeting.
#### 22. Added query parameters to control the visibility of each element in full-screen event mode.
#### 23. Implemented meeting volume control management.
#### 24. Enabled support for callbacks in the dashboard widget.
#### 25. Improved the signal indicator during calls.
#### 26. Defined interface requirements for meeting status display.
#### 27. Removed duplicate system account folders and transactions.
#### 28. Implemented a notification system and callback for calls from different workspaces.
#### 29. Added a system filter "System" to the actor bag.
#### 30. Implemented screen sharing with audio for any window.
#### 31. Disabled the "Connection error / Connection restored" notification in the widget.
#### 32. Allowed editing of all system layers in the graph
#### 33. Added dashboard legend
#### 34. Added System Stream Live in Events
#### 35. Redesigned Meeting Menu

### Smart Forms

#### 1. Enabled support for LESS style formatting in the smart forms editor.
#### 2. Adjusted default indentation in the script CSS editor between autoformat and editor.
#### 3. Added a mode for working with the list of events without opening event details.


## [0.3.47] - 2025-02-05
### Helm changes
- Applications versions:
  - server - 5.99.1
  - frontend - 5.99.1
  - realtime - 3.0.11
  - control-tasks - 2.46.0
  - widget - v1.50.0
- Add `startupProbe` for frontend deployment
- Add `lifecycle.preStop` for frontend deployment
- Set `worker_processes auto;` in nginx.conf
- Add `use epoll;` in nginx.conf
- Add parameters for future CDN usage.
- Add TTL for Redis data, if need - set parameter in `.global.control.redisTTL` in seconds. Minimal `1` (default `30`)

### Improvements / New Features

#### 1. Enabled adding not only accounts but also `actorsFilters` to the dashboard. This allows for comparing filter results without creating accounts and transactions in advance.
#### 2. Updated the color palette for actor states.
#### 3. Added TTL support for the API: API Documentation https://doc.simulator.company/#operation/uploadFile
#### 4. Introduced a coordinate grid inside cells on the graph.
#### 5. Added folder functionality for all actor sections.
#### 6. Implemented zoom in/out limits on the graph.
#### 7. Enhanced the Import (reuse) functionality.
#### 8. Added offset/limit support for public APIs:
- Get Actor Links https://doc.simulator.company/#operation/getActorLinks
- Get Linked Actors https://doc.simulator.company/#operation/getLinkedActors
#### 9. Improved the display of custom bars across different screen sizes.
#### 10. Added CDN support for files in the Simulator.
#### 11. Redesigned all contextual menus, including adding icons.
#### 12. Introduced a system layer on the graph: Legend.
#### 13. Developed a Public API for bulk deletion: `DELETE actors/bulk/actors_link`.
#### 14. Added group call functionality in the Simulator, including call recording.
#### 15. Enabled actor titles to display in two lines if they don't fit in one.
#### 16. In Accounts Templates, added JSON-like settings for text fields. This allows users to edit actors using a JSON editor for convenient free JSON editing. Additionally, JSON fields will now display in a formatted manner when viewing an actor.
#### 17. In Accounts Templates, added static date settings for calendar fields. When used, the selected date in the calendar will be recorded with timeZone: 0.
#### 18. Increased the input field size to 8 rows.
#### 19. For Split Mode, enabled line wrapping across all hotkeys + Shift.
#### 20. Improved the UI of the Transfers form
#### 21. Added the ability to specify custom period settings on dashboards
#### 22. Move Actor History to the History Tab
#### 23. Added the ability to rename actor attachments and made a public API for this
#### 24. Added automatic call transcription
#### 25. Implemented System Account Total edges
#### 26. Added Graph Full-screen mode
#### 27. Created a public method for renaming account_names
#### 28. Added a call duration timer
#### 29. Implemented highlighting of the active meeting tab during a call
#### 30. Enabled automatic focus on the screen of the user who started screen sharing during a call
#### 31. Added Speaker Settings in calls
#### 32. Added the ability to switch between events using the Tab key in Split mode
#### 33. Implemented the Hidden Reactions feature in events

### Smart Forms:

#### 1. Added tooltip support to the select component.
#### 2. Introduced a new component: edit of type colorPicker – Documentation https://doc.simulator.company/cdu#tag/edit.
#### 3. Renamed the Scripts section to Smart Forms and added Smart Form templates for creation.
#### 4. Fixed an issue in the `table(file)` component when closing the file preview with the Esc key.
#### 5. Optimized the `table(radio)` component with the clickable flag enabled for table rows.
#### 6. Added a `max limit` setting for the multiselect component.
#### 7. Implemented dynamic resizing of the iframe based on the dynamic form

### Widget:

#### 1. Created a command to get the actorId of the current chat in the widget:

    {{ctrl('webWidget', 'onStart', { actorId: `${actorId}`, callback: function (actorId, {eventActor, widgetActor}) { // Do stuff }
    ,
    });}}

#### 2. Added the resetContext command.
#### 3. Added a property to the Widget form: the ability to send files through the widget


## [0.3.46] - 2025-01-15 (Unreleased!)
### Helm changes
- Applications versions:
    - server - 5.96.1
    - frontend - 5.96.1
    - realtime - 3.0.10
    - control-tasks - 2.44.0
    - widget - v1.49.0
- Add `startupProbe` for frontend deployment
- Add `lifecycle.preStop` for frontend deployment
- Set `worker_processes auto;` in nginx.conf
- Add `use epoll;` in nginx.conf
- Add parameters for future CDN usage.
- Add TTL for Redis data, if need - set parameter in `.global.control.redisTTL` in seconds. Minimal `1` (default `30`)

### Improvements / New Features

#### 1. Enabled adding not only accounts but also `actorsFilters` to the dashboard. This allows for comparing filter results without creating accounts and transactions in advance.
#### 2. Updated the color palette for actor states.
#### 3. Added TTL support for the API: API Documentation https://doc.simulator.company/#operation/uploadFile
#### 4. Introduced a coordinate grid inside cells on the graph.
#### 5. Added folder functionality for all actor sections.
#### 6. Implemented zoom in/out limits on the graph.
#### 7. Enhanced the Import (reuse) functionality.
#### 8. Added offset/limit support for public APIs:
  - Get Actor Links https://doc.simulator.company/#operation/getActorLinks
  - Get Linked Actors https://doc.simulator.company/#operation/getLinkedActors
#### 9. Improved the display of custom bars across different screen sizes.
#### 10. Added CDN support for files in the Simulator.
#### 11. Redesigned all contextual menus, including adding icons.
#### 12. Introduced a system layer on the graph: Legend.
#### 13. Developed a Public API for bulk deletion: `DELETE actors/bulk/actors_link`.
#### 14. Added group call functionality in the Simulator, including call recording.
#### 15. Enabled actor titles to display in two lines if they don't fit in one.
#### 16. In Accounts Templates, added JSON-like settings for text fields. This allows users to edit actors using a JSON editor for convenient free JSON editing. Additionally, JSON fields will now display in a formatted manner when viewing an actor.
#### 17. In Accounts Templates, added static date settings for calendar fields. When used, the selected date in the calendar will be recorded with timeZone: 0.
#### 18. Increased the input field size to 8 rows.
#### 19. For Split Mode, enabled line wrapping across all hotkeys + Shift.

### Smart Forms:

#### 1. Added tooltip support to the select component.
#### 2. Introduced a new component: edit of type colorPicker – Documentation https://doc.simulator.company/cdu#tag/edit.
#### 3. Renamed the Scripts section to Smart Forms and added Smart Form templates for creation.
#### 4. Fixed an issue in the `table(file)` component when closing the file preview with the Esc key.
#### 5. Optimized the `table(radio)` component with the clickable flag enabled for table rows.
#### 6. Added a `max limit` setting for the multiselect component.

### Widget:

#### 1. Created a command to get the actorId of the current chat in the widget:

    {{ctrl('webWidget', 'onStart', { actorId: `${actorId}`, callback: function (actorId, {eventActor, widgetActor}) { // Do stuff }
    ,
    });}}

#### 2. Added the resetContext command.



## [0.3.45] - 2024-12-23
### Helm changes
- Applications versions:
    - server - 5.93.0
    - frontend - 5.93.1
    - realtime - 3.0.10
    - control-tasks - 2.43.0
    - widget - v1.48.0
- Add `startupProbe` for frontend deployment
- Add `lifecycle.preStop` for frontend deployment
- Set `worker_processes auto;` in nginx.conf
- Add `use epoll;` in nginx.conf
- Add parameters for future CDN usage.
- Add TTL for Redis data, if need - set parameter in `.global.control.redisTTL` in seconds. Minimal `1` (default `30`)

## [0.3.44] - 2024-11-20
### Helm changes
- Applications versions:
    - server - 5.90.0
    - frontend - 5.90.0
    - realtime - 3.0.10
    - control-tasks - 2.40.0
    - widget - v1.46.0
- Update local ScyllaDB up to 6.2 version.
- Add headers for SIP calls
- Add init Wait containers for PostgreSQL extensions

### Improvements / New Features

#### 1. Opened system layers for each graph. Currently empty.
#### 2. Started showing traces on the graph during copy and paste on the same layer.
#### 3. Implemented different cursors on the graph depending on the cursor's position and its interaction with other elements on the graph.
#### 4. Improved the calendar component.
#### 5. Refined traces on the graph, now undo/redo can be used in certain cases.
#### 6. Optimized the loading of actors with a large number of connections.
#### 7. Enhanced the event UI in full-screen mode for cases where an event needs to be embedded as an iframe in other interfaces.
#### 8. Added pagination to the Accounts section when displaying search results.
#### 9. Implemented the first version of anisotropy on graphs.
#### 10. Made the anonymous user in the Owner field of the event non-clickable.
#### 11. Added limit/offset in the getAccessInfo API.
#### 12. Changed the placement of the notification counter bubble in the event list.
#### 13. Enabled the ability to launch custom bars in frozen events.
#### 14. Removed the default option "Export Corezoid entities" when exporting a .graph file.
#### 15. Changed the actor's outline color on graphs.
#### 16. Redesigned event search in split mode, now the event does not switch to full-screen mode.
#### 17. Improved the use of the query parameter `query search_true|false` when embedding events as an iframe.
#### 18. Enhanced import/export:
   - Enabled the use of import strategy: reuse/replace/error.
   - Improved export/import of files embedded in an actor. Now, a new file is created, and the connection between the new file and the actor is maintained.
   - Fixed errors.
#### 19. Added support for P2P calls in Simulator. To start a call, hover over any user's profile and click the "Call" button.
#### 20. Enabled adding images to the graph via drag & drop.
#### 21. Automatic creation of "ref" for filter actors and forms.
#### 22. Performed FPS optimization in the graph editor.
#### 23. Enabled actor bag selection in the form editor.
#### 24. Redesigned the dashboard editing form.
#### 25. Added an event to the API key webhook URL when a form is created/edited.
#### 26. Prevented system accounts from being exported during export.
#### 27. Added a default form for creating actors on a layer.
#### 28. Introduced an "Expand" functionality for dashboards.
#### 29. Implemented a user list display showing users working on the same graph layer simultaneously.

### Scripts:
#### 1. Added the ability to specify `styleClass` globally for the page.
#### 2. Created a command to close a custom bar from Corezoid. https://doc.simulator.company/#operation/realtimeInterface -> scripts.toggle
#### 3. In the stepper component, enabled the ability to apply visibility for options.
#### 4. Added spellCheck in `edit - multiline`.
#### 5. Added the `submitOnEnter` property for the edit component.
#### 6. Improved the file component, allowing video file previews.
#### 7. Added zoom in/zoom out for pdf and doc files embedded in the carousel component.
#### 8. Made the title in the file component optional.
#### 9. Removed the `submitOnChange` trigger when using code 205 + viewModel.
#### 10. Added value updates forwarding into widget iframes.
#### 11. Added a footer to all scripts: "Powered by Simulator.Company".
#### 12. Added a `trimWhitespaces` field for components: edit, select, and multiselect.

### Widget:
#### 1. Implemented typing indicators for conversations:
   - for the operator in split mode event,
   - for the client in the chat widget.
#### 2. Added the option to remove the initial window from the widget, specifically the "Continue as anonymous" functionality.
#### 3. Enabled resizing of the widget.


## [0.3.43] - 2024-09-11
### Helm changes
- Applications versions:
    - server - 5.80.0
    - frontend - 5.80.1
    - realtime - 3.0.10
    - control-tasks - 2.36.2
    - widget - v1.41.2
- Added fix location in frontend subschart

### Improvements / New Features

#### 1. Added the logical OR operator to the actor filters API and the actor filters interface.
#### 2. Redesigned the display of reactions.
#### 3. Now, the comment from the transfer is passed to the corresponding transactions.
#### 4. Allowed extending event panels in split mode to a 15-85 proportion.
#### 5. Added the ability to filter by parameters in transaction data.
#### 6. Created an API for setting the status of reactions to "read".
#### 7. Added traces on the graph (actor movement history).
#### 8. Added support for filters in the API `Get actor by systemObjId`.
#### 9. Now showing the full name of the actor when hovering over the name.
#### 10. Added new query parameters to manage the Events section:
#### 11. Added `manageUI=search_false` (default is true).
#### 12. Added a separate `eventDoubleClick` (default is true).
#### 13. Created a new API to replace "Anonymous #" with another name.
#### 14. Now, comments from transfers are inherited in the corresponding transactions.
#### 15. Improved and enhanced the display of reactions in split mode.

### Scripts
#### 1. For the `button(options)` component, allow the action: logout.
#### 2. Added support for `submitOnScroll` for the `table` component.


## [0.3.42] - 2024-08-21
### Helm changes
- Applications versions:
    - server - 5.77.2
    - frontend - 5.77.0
    - realtime - 3.0.8
    - control-tasks - 2.36.0
    - widget - v1.40.0

### Improvements / New Features

#### 1. Updated the "Attachments" section for actors. Now, files are categorized into those directly attached to the actor and those added through the actor's reactions.
#### 2. Created an API for generating zip archives from files in the Simulator.
#### 3. Now, when a client follows a direct link to a script, the registration/authentication page will display the script's title and logo, making it clearer to the client where they are authenticating.
#### 4. Made the public API method `realtime/interface` available for managing event focus.
#### 5. Actors Bag: Added "Show more/Show less" in custom columns for displaying a large number of nested actors.
#### 6. Added the ability to download all files in one archive in the actor's "Attachments" section.
#### 7. For `sim.simulator.company`, emails about new events and reactions will now be sent even if the user’s event access is granted through a group.
#### 8. Created an API for filtering actors based on the user with whom the actor is shared.

### Scripts

#### 1. Added the `extra.mirrored` parameter to the `upload webcam` component (`https://doc.simulator.company/cdu#tag/upload`). Default is `false`.
#### 2. Now, when using the button with `action: logout`, error notifications about the user not being authenticated will no longer be shown.
#### 3. Fixed the functionality of the Twilio widget.
#### 4. Implemented custom bars functionality, allowing users to add selected scripts to the comment input panel for quick launching as widgets.

### Widget

#### 1. Added the ability to manage the sending of the "joined conversation" reaction to the client widget. This is configurable in the actor widget.
#### 2. Added the ability to style reactions sent from an API key in the widget.
#### 3. (See: `https://doc.simulator.company/#operation/createReaction`)
#### 4. Added the `extra.commentStyleType = primary | secondary | text` field.
#### 5. The reaction will be styled only in the widget. Inside the Simulator, it will remain a standard reaction.


## [0.3.41] - 2024-07-31
### Helm changes
- Applications versions:
    - server - 5.74.0
    - frontend - 5.74.0
    - realtime - 3.0.8
    - control-tasks - 2.33.1
    - widget - v1.37.0
- Update images url - set `{{ .Values.global.imageRegistry }}` for domain registry.
- Added new imageRegistry Hub in values.yaml

### Improvements / New Features

#### 1. Event Calendar. Added the ability to focus events for the component in CDU.
#### 2. Implemented the ability to create actors inside states on graphs.
#### 3. Improved snippets. Now, if an attachment is added to an actor-snippet, this attachment will automatically be pulled into the message when using the snippet.
#### 4. Ratings left in events are recorded as transactions on the corresponding account in the actor event.
#### 5. Added the ability to copy field_key on the actor card.
#### 6. Now all actor reactions are recorded as transactions on the corresponding actor accounts.
#### 7. Removed the API method GET /accounts/value/:accountId.
#### 8. Increased the size of REF transactions to 500 characters.
#### 9. Added copy chip to accounts in the actor panel.
#### 10. Implemented the ability to hide the delete button on reactions. Control is done through a query parameter.
#### 11. Added support for event colors. Now, if an actor-event has a specified color parameter, the event in the general feed will be colored accordingly.
#### 12. Implemented a mechanism for opening event details without a list, controlled via a query parameter.
#### 13. User login is displayed when searching for users to grant access rights.
#### 14. Added default limit in API GET invites: 20.
#### 15. Synchronized workspace dropdown list in Simulator and Account interfaces.
#### 16. Added changes to the Single account user field in the actor change history.
#### 17. Implemented positioning of states on the same plane.
#### 18. Transactions export. Added 2 fields in the export file: originalDateFormatted and createdAtFormatted.
#### 19. System accounts are no longer displayed in the transfer creation form.
#### 20. Added a choice for users during export - whether to export users and their access rights.
#### 21. Implemented cell coordinates on the graph.
#### 22. Added ref to the actor change history.
#### 23. Increased the limit of accounts on one dashboard to 50.
#### 24. Started displaying access on the history page.
#### 25. Implemented display of transactions by roles (signer / executor / viewer) in actors.
#### 26. Added event highlighting on hover in the Events list in split view mode.
#### 27. Started displaying reaction send time in seconds on hover over the reaction.
#### 28. Event calendar. Added a get parameter to change the time display format in the calendar.
#### 29. Optimized loading of a large number of reactions in an event.
#### 30. Increased the limit of loading events in split mode to 20.

### Scripts:
#### 1. Added the ability to pass allow settings to the widget component.
#### 2. Widget component, updated the version of onfido with which the widget is integrated.

### Widget:
#### 1. Optimized widget loading, removed unnecessary requests.
#### 2. In the Meta info of the event, started displaying context if it's passed when starting the widget.
#### 3. Improved UI of the widget.


## [0.3.40] - 2024-06-19
### Helm changes
- Applications versions:
    - server - 5.69.0
    - frontend - 5.69.0
    - realtime - 3.0.7
    - control-tasks - 2.32.4
    - widget - v1.34.1
- Add Grafana dashboards
- Add `tolerations` for pods
- Add `redis-control` for control use only
- Add new location for zoom-oauth
```
{{- if .Values.global.control.zoom_auth }}
location /zoom-redirect-oauth {
    rewrite ^/zoom-redirect-oauth$ {{ .Values.global.control.zoom_auth.url }} permanent;
}
{{- end }}
```

### Improvements / New Features

#### 1. Implemented pagination functionality on the graph. This allows for partial loading of large graphs, only the part that is currently on the screen.
#### 2. Improved the display of event cards in the Event calendar.
#### 3. Automated the creation of connections between actors based on transactions on actors' account forms.
#### 4. Implemented state markup functionality on graphs.
#### 5. Added search functionality in the Account field in the transfer creation form.
#### 6. Removed the api `actors_filters/stream/:formId/:name`.
#### 7. Added the ability to pin states.
#### 8. Enabled building dashboards using the `originalDate` of transactions.
#### 9. Enhanced graph valency, now it is possible to create both parent and child connections.
#### 10. Extended the Bar dashboard type. It is now possible to display multiple actors by day.

### Scripts

#### 1. Enabled blocking the time picker in the Event calendar, which is embedded in scripts as an iframe.
#### 2. The script page now waits for the styles request to complete before loading.
#### 3. Enabled resizing of the event card in the calendar if the calendar is embedded in the script as an iframe.
#### 4. Added header and footer for one column grid: https://doc.simulator.company/cdu#tag/page
#### 5. For the Amazon Connect widget, added an Action to end the call.
#### 6. For the Amazon Connect widget, the call ends when the browser tab is closed.
#### 7. In the upload and signature components, proxied the `api.uploadUrl` for uploading files to an external resource instead of the Simulator.

### Widget

#### 1. Added support for context, which allows passing any chat information during the initialization of the widget.

---

## [0.3.39] - 2024-05-01
### Helm changes
- Applications versions:
    - server - 5.63.0
    - frontend - 5.63.0
    - realtime - 3.0.5
    - control-tasks - 2.32.0
    - widget - v1.32.0
- Changed access_log stdout in frontend and widget subcharts
- Refactor EFS settings in subcharts.
- Added support for working with s3 bucket. Example in values.yaml:
```
    filesStorage:
      type: "s3" # AWS S3 or AWS EFS
      region: "eu-west-1"
      bucket: "mw-dev-control-2-storage" # for AWS S3
      eventFiles: "/ebsmnt/attachments"
```

### Improvements / New Features

#### 0. Important! For the API GET /actors_accounts/actorID, we set the default limit to 30.
#### 1. Form editor - Accounts. Moved the Add account button to the top.
#### 2. Added documentation for analytical counters at https://doc.simulator.company/#tag/counters.
#### 3. Allowed multiple additions of the same parameter in the actorFilter creation interface.
#### 4. Improved the display of originalUser.nick in the event feed, last reaction.
#### 5. Created a transfer holding functionality https://doc.simulator.company/#operation/createTransfer.
#### 6. Developed an API for retrieving a transfer by ref.
#### 7. Created a calendar view mode for events. Also, added a separate path to embed the calendar in the widget component in Scripts.
#### 8. Removed the old implementation of string/actorId accounts.
#### 9. Changed the display of links in the graph from straight to curved.
#### 10. In the split mode of events, made external links non-clickable.
#### 11. Added a step to select a role when inviting a user in the manage access rules window.
#### 12. Increased the REF size of an actor to 3000 characters.
#### 13. Retained only the finance type of transfer.
#### 14. Added the ability to control the buttons available in the comment input window through query parameters.
#### 15. Made it possible to customize the order of stream arrangement.
#### 16. Changed the default time for creating events to the current time.
#### 17. In the make transaction window, added account sub-scrolling in the account list.
#### 18. Added a history of adding and removing accounts to the actor's change history.
#### 19. Developed an API to enable streaming for a specific group of users.

### Scripts:
#### 1. Fixed the operation of the forward/back navigation arrows in the browser.
#### 2. Integrated with Amazon Connect in the widget component.
#### 3. Enhanced the resolution when displaying PDFs.
#### 4. Supported bb-code in the title component of the button.
#### 5. Added the value attribute to the carousel component.
#### 6. Supported embed code.

### Widget:
#### 1. Changed/improved the logic for generating fingerprints in the widget and scripts.


## [0.3.38] - 2024-04-12
### Helm changes
- Applications versions:
    - server - 5.59.2
    - frontend - 5.59.1
    - realtime - 3.0.5
    - control-tasks - 2.29.0
    - widget - v1.28.1
- Add sub-chart for scyllaDB (support only one node, will be update in future)
- Attention! ScyllaDB moved to global.control block (view example in [values.yaml](./values.yaml#L124) )
- Switch to bitnami image for PgBouncer
- Code refactoring

### Improvements / New Features

Bug fixes/enhancements on the server


## [0.3.37] - 2024-04-04
### Helm changes
- Applications versions:
    - server - 5.59.1
    - frontend - 5.59.1
    - realtime - 3.0.5
    - control-tasks - 2.29.0
    - widget - v1.28.1

#### Attention! Please pay attention to the description in chart 0.3.36.

### Improvements / New Features

#### 1. In System accounts > Coordinates, transactions reflecting actor coordinate changes were implemented on the graph.
#### 2. Sorting by actor fields was added to the actors bag.
#### 3. In the Create transfer interface, the ability to make transfers from multiple senders to multiple recipients was added. Previously, only one sender was allowed.
#### 4. Real-time graph rendering was optimized.
#### 5. The ability to recalculate settlement balances was added.
#### 6. The API now allows filtering in actors_filters based on associated actors.

Scripts:
#### 1. Components upload and signature were refined, and the file upload protocol was changed to an external API.
#### 2. A mechanism for running public scripts under a different domain was implemented.
#### 3. Control over query parameters at the page configuration level and via send request with a 200 response code was enabled.
#### 4. Transition to another page via a 205 response code without reloading the entire page was implemented.


## [0.3.36] - 2024-03-28 (The chart was not released, will be included in 0.3.37)
### Helm changes
- Applications versions:
    - server - 5.58.1
    - frontend - 5.58.0
    - realtime - 3.0.5
    - control-tasks - 2.28.0
    - widget - v1.27.0
- added the ability to specify annotations on the ingress in values.yaml

### Improvements / New Features

#### 1. Added image resize to the short menu of actor-image on the graph.
#### 2. Implemented a public API to retrieve the form by formRef.
#### 3. Introduced a new type of dashboards - Line > Dynamics of balance changes.
#### 4. Enabled the ability to control the display of values in sections on dashboards. Previously, values were always displayed and couldn't be turned off.
#### 5. Added display of the Ref field in Actors bag and Forms.
#### 6. Enhanced image resize on the graph.
#### 7. Implemented the ability to view all graph connections with other actors and add new parent actors for this graph.
#### 8. Developed visualization for the dashboard loading process if the dashboard is not displayed instantly.
#### 9. Added extra for each field editable in the method https://doc.simulator.company/#operation/updateActor.
#### 10. Create API for multi-transfers

### Scripts:
#### 1. Added the ability to set changeRules for components carousel, select, radio, tab, multiselect, table, and stepper when responding to a send request. https://doc.simulator.company/cdu#operation/sendForm.
#### 2. Improved the OTP component - now the deletion of values from cells works correctly.


## [0.3.35] - 2024-02-21
### Helm changes
- Applications versions:
    - server - 5.53.3
    - frontend - 5.53.0
    - realtime - 3.0.4
    - control-tasks - 2.25.0
    - widget - v1.23.0

### Attention!!!
- **This version adds the required ScyllaDB component for the control_tasks application to work (The keyspace must be the same as the control_server)**
- **First, perform an update to Chart 0.3.34, only after that proceed with the update to 0.3.35 !**
- **Migration of transaction data slices from PostgreSQL to ScyllaDB from the latest migration checkpoint.**
- **Transfer of balance cache from Redis to Scylla. It will heavily impact account trees, dashboards, formulas, triggers. If there are large trees in the environment, there will be a risk of their recalculations and storing in ScyllaDB, which will impose a heavy load on PostgreSQL in this case.**

### Improvements / New Features

#### 1. Created an access graph for the actor.
#### 2. Migrated current snapshots of account balances from PostgreSQL to ScyllaDB.
#### 3. Transferred tree counters of accounts from Redis to ScyllaDB.
#### 4. Migration Documentation URL
   API: https://doc.simulator.company/
   Scripts: https://doc.simulator.company/cdu
#### 5. Removed the ability to delete transactions in the interface


## [0.3.34] - 2024-02-07
### Helm changes
- Applications versions:
    - server - 5.51.0
    - frontend - 5.51.1
    - realtime - 3.0.4
    - control-tasks - 2.24.0
    - widget - v1.21.0

### Attention!!!

- **First, perform an update to Chart 0.3.33, only after that proceed with the update to 0.3.34 !**
- **Migration of transaction data snapshots from PostgresQL to ScyllaDB. The lengthy migration of 65 million queries takes approximately ~4 hours.**
- **As there will be increased load on PostgresQL and the control server, it is preferable to conduct the migration outside of business hours.**

### Improvements / New Features

#### 1. The support of GET parameters in the Simulator URL has been implemented to manage the visibility of the Events page UI elements when in the switch view mode:
   - **plainMode**: true/false. If set to true, the split view on the Events page is forced regardless of user settings.
   - **focusMode**: true/false. Turns off the top panel and all the selected event tabs in the split view mode on the Events page.
   - **manageUI**. Allows to manage the following blocks:
     - **sidebar**
     - **streamsTabs**: true/false
     - **streamsControls**: true/false
     - **eventControls**: true/false
     - **eventInfo**: true/false
     - **eventTabs**: true/false is the list of tabs separated by «_», for example: chat_details_attachments.

You can manage the visibility of the following tabs: Details, Info, Chat, Shared, Attachments, Accounts, Events, Actors.

Inside the manageUI, elements are separated by «:», while keys and values are separated by «_», for example:

```
"manageUI=eventTabs_chat_details:eventInfo_false:eventControls_false"
// The eventInfo and eventControls are turned off, tabs are reduced to chat and details"focusMode=true&manageUI=eventTabs_chat_details:eventInfo_true:eventControls_true"
//The focusMode is used to turn off all elements except those allowed in the parametermanageUI "plainMode=true&focusMode=true&manageUI=sidebar_true"
// The split view mode is activated, and all the elements are turned off except the sidebar allowed in the manageUI"manageUI=eventTabs_false"
//All the tabs are turned off
```

**Note**: When using any of the mentioned GET parameters, the type: viewActor request type is sent to the API user webhook with access to the event. This info allows Corezoid processes to determine which event is in the user focus now.
This feature comes in handy when you embed the Events page as a [widget](https://doc.simulator.company/cdu#tag/widget) into Scripts.

#### 2. The My verse page on which you can quickly access your graph with main user resources and objects in the selected workspace has been updated.
#### 3. Work with dashboards has been improved
   You can add the same account with different incomeType parameters (debit,credit) to a dashboard: select the Income type checkbox in the Legend settings section of the dashboard settings menu.
   Resizing became more convenient: Only the side that you are dragging is being resized.
   The dashboard title was removed from the dashboard expanded view.
#### 4. Transaction filter API requests have been optimized to run much faster.
#### 5. The new [signature](https://doc.simulator.company/cdu#tag/signature) component was added. The component implements a whiteboard on which you can make a drawing and save it as an image. For example, you can use it to create a client signature.


## [0.3.33] - 2024-01-24
### Helm changes
- Applications versions:
    - server - 5.49.1
    - frontend - 5.49.0
    - realtime - 3.0.4
    - control-tasks - 2.23.0
    - widget - v1.19.0

### Attention!!!

- **First, perform an update to Chart 0.3.32, only after that proceed with the update to 0.3.33 !**
- **The migration of the 'transactions' table is very lengthy. If there are 100 million records, the migration may take approximately 72 hours.**
- **It is imperative to perform pg_repack on all partitions.**

### Improvements / New Features

#### 1. You can go to the needed transaction history by clicking the corresponding sector on the Dashboard. The transaction history opens as a list in a modal window.
#### 2. The sounds for the following actions have been updated:
   - Adding an actor to a graph
   - Creating a link (edge) between actors on a graph
   - Removing an actor from a graph
#### 3. Online Dashboards are updated if the Real-time option is selected in the Period by default dropdown list
#### 4. When sharing an object, you can see the list of recommended users that includes the users with whom you have shared your previous object.


## [0.3.32] - 2024-01-17
### Helm changes
- Applications versions:
    - server - 5.48.0
    - frontend - 5.48.0
    - realtime - 3.0.4
    - control-tasks - 2.23.0
    - widget - v1.19.0

### Attention!!!

- **This version adds the required ScyllaDB component for the control_server application to work (ScyllaDB must be installed on a separate server. For production environments, we recommend the ScyllaDB cluster)**
- **there will be 3 migrations 5.46.0, 5.47.0, 5.48.0**
- **migration 5.47.0 will have a long-term migration of the transfers table with batches, which should be completed after repack**

### Improvements / New Features

#### 1. When you create or edit a dashboard, you can select the default account and currency in the Account by default field of the Add chart dialog. After that, you need to select actors with the account-currency chosen pair in the Actor field to build a chart.
   Note. Default account availability for the selected actors
   If an actor you've selected has the chosen account-currency pair, it will have the account value displayed to the right of the Account field (1). If the selected actor doesn't have the chosen account-currency pair, the "i" info icon will be displayed to the right of the Account field (2), informing that you must select an actor with the account-currency pair set by default.

#### 2. The dashboard widget now has the Settings dropdown menu where you can select an interval and switch the account and account value type (amount or count of transactions), thus viewing the same dashboard for different accounts.
   Note. Settings for dashboards with no Account by default selected
   On the dashboards with no Account by default selected, the Settings menu allows selecting a time interval and switching between the amount and transaction count values.
   The Settings menu configuration does not affect the dashboard creation/editing menu configuration.
#### 3. The feature of creating dynamic dashboards based on actor filters was added. To create a dynamic dashboard, in the Dashboard type field of the Add chart dialog, select Dynamic by ActorFilters.
   After creating this dashboard type:
   - Select the specific filter you want to use to build your dashboard in the Select Actors Filters dropdown list.
   Note: The selected Actor Filter must have an account to build a dashboard.
   - Select the Top number that defines the number of top actor accounts from the filter range, which values will be displayed on the dashboard.
   You can't build a Line chart type with the Dynamic by ActorFilters dashboard type
#### 4. Now, you can add images and gifs anywhere in the text when editing an event or actor description, which makes editing big event descriptions easier. With that, the cursor maintains a correct position.
#### 5. API methods for getting account names were optimized.

#### 6. Improved readability of actors and connections on the graph:
   - Increased the size of actors on the graph
   - Enhanced the contrast of connections between actors
   - Added a background to the title of actors

#### 7. Scripts: Now, with each /get and /send request, a new parameter sessionData.fingerprint is included.
   The fingerprint is provided independently of the script authorization settings. This parameter can be used as a session ID.

#### 8. Enabled the ability to perform transfers on the graph.
   To initiate a transfer, hover over the connection between actors, and a "+" sign will appear.
   Click on the "+" sign, and in the transfer creation form, specify the amount and, if necessary, switch the sender and receiver.
   Transfers are executed based on the account selected in the layer settings.
   If any of the selected actors do not have an account, it will be automatically opened.
   If there are transfers between two actors added to the layer on the selected account, they are displayed as green arrows. The thicker the arrow, the larger the transfer amount. The amount is calculated relative to all transfers on this layer.

#### 9. Added support for the "filter" parameter in all GET methods for transactions.
   https://control.events/api.html#tag/transactions
   It is recommended to use it for response size optimization.

#### 10. Add new component ScyllaDB

#### 11. You can specify the default account-currency pair for a graph layer

#### 12. You can view a Line type Dashboard for any account in the actor panel of the Accounts tab by clicking the account menu icon and selecting the Show dashboard in the menu.

#### 13. The feature of saving a multilayer position on a graph has been added.


### Bugfix

In the scripts, fixed the redirect for the 302 code to the same page_id where the user is currently located. Now, such redirects work as expected.


## [0.3.31] - 2023-12-21
### Helm changes
- Applications versions:
    - server - 5.45.0
    - frontend - 5.45.1
    - realtime - 3.0.4
    - control-tasks - 2.21.0
    - widget - v1.17.0

### Improvements / New Features

#### 1. Implemented the capability to resize panels in the Events section in split mode.
#### 2. Updated the structure of the left-side menu.
#### 3. Optimization of access rights management.
#### 4. Fixed the real-time functionality in scripts.


## [0.3.30] - 2023-12-18
### Helm changes
- Applications versions:
    - server - 5.44.0
    - frontend - 5.44.1
    - realtime - 3.0.4
    - control-tasks - 2.20.0
    - widget - v1.16.0

### Improvements / New Features

#### 1. When clicking the push notification on a new reaction in an event with the Split view enabled on the Events page, the Split view remains, and the event with the new reaction becomes active.
#### 2. By using the API method actors_filter, you can filter actors by account balance
#### 3. All the GET API method accounts have the filter parameter. For example:
   filter=id,amount,incomeType … , where you have the list of comma-separated fields to receive for every account in response data
#### 4. With the new API Get account value info method, you can get the details of actors listed on the balance of the Actor ID account in one request
#### 5. On the dashboard, you can add up to 30 accounts.
#### 6. By using the API Filter actors by form method, you can sort actors by any field: the request gets the orderByKey field where you have to enter the key to make a sorting. For more information, go to [Filters actors](https://control.events/api.html#operation/filterActors)
#### 7. The redesigned transfer details page allows you to see the details of changes against text and actor ID accounts that occurred within a transfer.
#### 8. On Dashboard charts, you can see the values for each part.
#### 9. The display of the Events page and all your events’ details are a better fit for your mobile device browsers.
#### 10. Localization support was added. In the locale file, you can configure your localization

```
{
 "legacy": "Зворотня сумісність",
 "label": {
   "en": "Hello page",
   "uk": "Привіт сторінка"
 }
}
```

Where: uk and en are the keys with any value; you can have any number of such keys.The old keys remain operable as before.To use a particular localization language, you need to send the language parameter together with the language value from Corezoid in response to the /get request. For more information, go to Get page https://control.events/script.html#tag/get-page  and Locale.
#### 11. The protocol for working with widget commands from scripts that run in the widget has been changed:

```
{
"data": {
    "ctrl": [
        {
            "namespace": "webWidget",
            "method": "close"
        }
    ]
},
"code": 200
}
```

#### 12. In the Actor filter, you can filter actors by account balance:
   Select an account and enter the needed values to the Balance from and Balance to fields.
   (Optional) Select the needed sorting in the Sort by dropdown list.
   As a result, you can see the list of actors with the Account-Currency column displaying the selected account balances for actors.
#### 13. In the Edit Chart dialog, you can:
   Customize the colors for your chart by entering the needed color codes.
   Regenerate all colors by clicking the refresh icon next to the Color field to set random colors for each part of your chart.
   Note: The Use actors colors option has been removed.
#### 14. The calculation of balances in account trees has been optimized.
#### 15. Enabled the ability to embed events into scripts without unnecessary components.

###  Scripts

#### 1. You can use the mapping functionality when importing scripts: If the file that you are importing has at least one script, when mapping, the Corezoid credentials tab appears where you can specify new corresponding credentials for each script. This feature simplifies the import of scripts and makes it possible to use them immediately after the import is complete.
#### 2. The following components have the context menu:
   Button: options are described in extra.options.
   For more information, go to [Button](https://control.events/script.html#tag/button).
   Table: options are described in body[].options[].button.extra.options.
   For more information, go to [Table](https://control.events/script.html#tag/table).

   More information:
   https://doc.corezoid.com/docs/simulator-541
   https://doc.corezoid.com/docs/simulator-542
   https://doc.corezoid.com/docs/simulator-543
   https://doc.corezoid.com/docs/simulator-544


## [0.3.29] - 2023-11-16
### Helm changes
- Parameters in applications configs are moved to deployment via env, transmitted through secrets
- Optimization of nginx config and image reduction
- Added additional settings and ingress for moving from one domain to another
- Applications versions:
    - server - 5.40.1
    - frontend - 5.40.0
    - realtime - 3.0.4
    - control-tasks - 2.18.0
    - widget - v1.13.0

### Improvements / New Features

#### 1. The following two new API methods were added:
   https://control.events/api.html#operation/getAccountBulkRefs
   https://control.events/api.html#operation/getActorByObjId
#### 2. You can copy an attached file URL in the actor’s Attachments tab.
#### 3. In the Constructor tab of the actor’s form, you can configure the Autocomplete search (Yes/No) field in the Dropdown fields.
#### 4. Now, you don’t have to click Save to save the Actor’s description changes as they are saved automatically.
#### 5. You can use the new Line type for dashboards that shows the dynamics of transactions (amount and number) of selected accounts.
#### 6. The Total transfer type has been added to the Make transfer form and is made available for the Numeric account type. For the String and Account ID account types, use the Debit and Credit types. When making a transfer with the Total type selected:
   A positive debit transaction is made against the actor account selected in the Actor from field.
   A positive credit transaction is made against the actor account selected in the Actor to field.
   Note: When you select the Total type in the Actor from line, the Type field in the Actor to line gets disabled.
#### 7. On the Events page:
   - You now have the counter of the number of unread messages in the chat list on the open Conversation panel and in your chats where you need to scroll to see new messages.
   - To send a message in a chat, you have a new option to send a message in a chat by pressing Enter on your keyboard.
   - The events are not grouped by the View and Freeze user reactions anymore.
#### 8. In the form constructor, you can collapse a large list of fields with the manual options source.
#### 9. You can visualize connections between actors based on their transfer history. To view these connections, simply add actors to the layer and in the upper-right corner, select the account-currency pair:
   - The direction of the arrow shows the transfer source and recipient.
   - The captions on the arrow displays the total amount and number of transfers made.
   - The arrow thickness depends on the total transfers amount.
#### 10. In the actor’s change history, you can:
   - Quickly switch between the history periods by clicking the arrows next to the period
   - View the correct representation of changes when the actor’s data type is JSON
#### 11. On the dashboards:
   - You can specify the Y-Axis label for the Bar and Line charts in the Edit Chart form.
   - You can specify the number rounding method (decimal positions after comma) in the settings of the account-currency pair.
   - When resizing, the chart fits completely into the selected frame displaying the full legend, without the need to scroll and crop.
#### 12. For actors-images, a title is no longer displayed on a graph, only an image.
#### 13. For the Create transfer API method, the finance type has been added:
   - All the accounts with the finance from must be debit.
   - All the accounts with the finance to must be credit.
   - The amount must be positive for all accounts.
For more information, go to Create transfer.
#### 14. The Create transaction method has been improved: the addValues and delValues parameters have been added to the String and Actor ID account types. For more information, go to Create transaction.
#### 15. Account trees and formula calculations are now performed asynchronously, and the derived balances are stored in the database.
This improvement reduces system load when handling account balances generated by a tree or formula, enabling smoother utilization of these accounts on dashboards
#### 16. The selection of an account-currency pair on graph layers was simplified by implementing a unified component that combines account and currency selection into one operation.
#### 17. Now all drop-down lists in the actor structure have an additional option to delete values, which provides more flexibility and data management control.
#### 18. The Export & Import functionality has been improved:
   - If the Export accounts with transactions and transfers checkbox is not selected, the accounts are exported and imported with 0 balance correspondingly.
   - The import of TransactionFilters and Dashboards actors has been refined, replacing the account-currency pairs with new ones during the import.

###  Scripts
#### 1. In the Widgets form, you have two new fields: Start and Final. If the scripts are selected in the actor’s widget settings:
   - The Start script is launched automatically when the dialogue starts.
   - The Final script is launched automatically when the dialogue is closed.
#### 2. You can set the modal window size by using styles
#### 3. You can load faster script pages that don’t have dynamic content without sending a request to Corezoid: Right-click the needed page, and then select Make static page. The static pages are marked with the S letter
#### 4. You can use styles for the calendar component and table elements. For more information, go to Style.
#### 5. For the public API, baseURL has been changed: https://api.simulator.company/v/1.0. Though the old baseURL will be supported for some time, we recommend changing the current baseUrl with the new one in your Processes as soon as possible.
Note: This does not affect the clients who use In-House Simulator.Company versions.
#### 6. For the sidebar component, the Skill bar type has been added. For more information, go to Slider.

### Fixed Issues
#### 1. Adding two variables in one key via the viewModel method failed: Now, you can use the "value": "{{amount currency"}} template to add two variables in one key.
#### 2. Calendar component: You can easily select the period in the calendar component throughout the system.
#### 3. Automatic snippet search: When entering first name characters in the Comment field, the list of snippets with corresponding names appears.
#### 4. Push notifications on new events and reactions within events have been improved in the browser. Notifications now have a consistent display, providing a universal look for both push notifications and internal notifications.
#### 5. The handling of user and actor tags in actor descriptions and reactions has been optimized.

### More information:
https://doc.corezoid.com/docs/simulator-537
https://doc.corezoid.com/docs/simulator-538
https://doc.corezoid.com/docs/simulator-539
https://doc.corezoid.com/docs/simulator-540


## [0.3.28] - 2023-10-19
### Helm changes
- Parameters in applications configs are moved to deployment via env, transmitted through secrets
- Optimization of nginx config and image reduction
- Added additional settings and ingress for moving from one domain to another
- Applications versions:
    - server - 5.36.0
    - frontend - 5.36.0
    - realtime - 3.0.4
    - control-tasks - 2.16.0
    - widget - v1.9.0

### Improvements

#### 1. The visualization of an actor's history was improved
#### 2. You can open the Events menu without using the left sidebar: Add the ?hideSidebar=true appendix to the event URL.
#### 3. In the Preview mode of the Actors Card constructor, you can change the card opacity.
#### 4. You can collapse and expand the dashboard actor on the graph.
#### 5. YouTube Integration: Now, when an actor description or reaction text contains a link to a YouTube video, you'll see a YouTube video preview widget and will be able to launch the video directly from the platform.
#### 6. In the Events split view mode, the Info and Details tabs have been merged into the Details tab with the Chat tab moved to the first position in the details window.
#### 7. The Get list of transactions by account id method was added to the API documentation
#### 8. Full-text search for actors has been optimized and works faster now.
#### 9. Requests for granting and receiving access permissions are sent faster now.
#### 10. On the Transactions page, you can export transactions as .csv and .xls files. When clicking Export, the export of all transactions that fully match the specified filter in the Transactions section starts.
#### 11. On the Events page, you can receive sound and push notifications that you can configure in Notifications of the Settings section.
#### 12. You can add reactions to actors within a third-party system, enhancing your engagement and interaction capabilities
#### 13. You can filter events by:
- Multiple owners simultaneously
- To Do and To Sign categories
#### 14. When creating a transaction against a text or actor ID account, the transaction value is now sent to the user's API webhook.
#### 15. For the updateActor event type, the user's API webhook will now receive the additional diff field with the change object.
#### 16. The Import & Export feature has been upgraded: Now, all types of connections are exported and imported along with the actor, making data management even more comprehensive.

### Scripts
#### 1. You can embed dashboards into scripts using the widget component. `extra.widgetUrl` must be formed this way: `{{{simulatorEnvUrl}/dashboard/{accId}/view/{actorId}}}`, where:
##### a. `simulatorEnvUrl` is your Simulator’s URL (for example, https://admin.control.events).
##### b. `accId` is your Workspace ID.
##### c. `actorId` is your dashboard actor ID.
#### 2. Use the modalHeader array for modal type sections. If the array isn't empty, the standard modal close cross won't be displayed, allowing you to customize the modal header and track cross clicks in your Process


## [0.3.27] - 2023-10-04
### Helm changes
- Applications versions:
    - server - 5.34.0
    - frontend - 5.34.1
    - realtime - 3.0.4
    - control-tasks - 2.14.0
    - widget - v1.8.0

### Improvements

#### 1. Added new functionality Filters in Events
   Filters are applied based on the event creation date and event owner.
   The filter can be applied to all events (All stream) and within a specific stream.
   The filter resets when the Events section is closed or when the page is refreshed.

#### 2. Improved Import/Export functionality. Now, all actor relationships with the hierarchy type are exported and imported along with the actors.

#### 3. Added a new attachment component. Suitable for simultaneous uploading of multiple files. https://control.events/script.html#tag/attachment

#### 4. Increased the maximum file size that can be uploaded to the cloud version to 100 MB. https://admin.control.events/

#### 5. For event types: updateReaction and deleteReaction received via the user API webhook, added the parameter payload.treeInfo.rootActorFormId to the data model.

#### 6. For public API methods:
   getAccountNames - https://control.events/api.html#operation/getAccountNames
   getCurrencies - https://control.events/api.html#operation/getCurrencies
   Changed the default value of the withStats parameter.
   The new default value for withStats is false.
   Note: If you pass withStats: false, the method will work much faster.

### Bug Fixes:
#### 1. Fixed the display of the API key avatar in the chat widget.

#### 2. Fixed bulk tag replacement in the settings for the Currency_Account pair.

#### 3. Fixed the formation of the sessionData object for SSO users, which is sent to the script process receiver. Now, the sessionData structure is consistent with what is sent for users with other types of authorization.


## [0.3.26] - 2023-09-27
### Helm changes
- Applications versions:
    - server - 5.33.0
    - frontend - 5.33.0
    - realtime - 3.0.4
    - control-tasks - 2.13.0
    - widget - v1.7.0

### Improvements

#### 1. New types of accounts have been introduced: String and Actor ID, and the Accounts page in the actor's panel has been redesigned.
#### 2. Improved the display of icons on user avatars through the API. They now appear in all places in the Simulator.
#### 3. Added a new section in the Simulator - Outer Graph.
   Outer Graph is a public graph where any company (workspace) owner can configure their company's card and publish it to the public graph for interaction with clients and partners.
#### 4. Implemented the opening of custom actor creation forms through the Actors bag.
   If a system form is selected when creating an actor in the Actors bag:
   Dashboards, TransfersFilter, AccountTriggers, ActorFilters, TransactionFilters
   Then a non-standard custom form will automatically open for these forms, as this form is specific to each of these types of actors.
#### 5. Dashboards improvements:
##### 5.1. In the dashboard constructor, the ability to sort accounts on the chart has been added.
##### 5.2. In the dashboard constructor, the ability to configure a legend that will be displayed on the chart has been added.
#### 6. In the mobile version, a "Make transfer" button has been added to the main screen for quick transfer creation from a smartphone or tablet.
#### 7. Import/export:
   Made it possible to import without deleted objects in the actor's data.
   If there are deleted objects in the actor's data:
   Objects: actors, currencies, actor names
   They are deleted from the structure during export, and the export is done without these fields. Accordingly, during import, these fields will not be present in the actor's model.
#### 8. Optimized the API for retrieving transactions and transfers. Response time has significantly decreased.

### Scripts:
#### 1. Added functionality for auto-submit for the Button component.
   https://control.events/script.html#tag/button
   extra.autoSubmit
#### 2. Introduced a new toggle component.
   https://control.events/script.html#tag/toggle
#### 3. Introduced a new slider component.
   https://control.events/script.html#tag/slider
#### 4. In the table component, added functionality for clickable rows in the table.
   https://control.events/script.html#tag/table
   body[].clickable

### Bug Fixes:
#### 1. Fixed a case where it was impossible to revoke access rights to an actor for a user.
#### 2. Fixed a bug where custom actor colors were not saved when creating a new actor.
#### 3. Fixed the display of the select component. Sometimes, an empty space was added at the end of the list.


## [0.3.25] - 2023-09-06
### Helm changes
- Add `apiGateway` parameter in `server` configmap
- Applications versions:
   - server - 5.30.0
   - frontend - 5.30.0
   - realtime - 3.0.3
   - control-tasks - 2.11.2
   - widget - v1.5.0

#### Improvements
#### 1. Implemented dashboard functionality.
Dashboards are graphical panels with data sources that include account balances or the number of transactions on them. Dashboards can be displayed as charts on graphs. Dashboard chart is an actor in the Dashboards system form.

How to add/create a chart:
##### 1.1. In the Actors bag, create an actor in the system form: Dashboards.
##### 1.2. Click the "Add chart" button on the layer.
##### 1.3. On the graph, use lasso to select actors, choose "Add chart," and a chart will be automatically created using the selected account_currency pair on this graph (top right). You can then edit and refine this dashboard.

 - Title: Dashboard name
 - Chart type: Bar, Line, Pie, Doughnut, Funnel, Table
 - Period by default: The dashboard will be generated by default for the selected period, which can be changed on the chart itself.
 - Account value type:
 - Count of transactions: The dashboard will display the count of transactions on the selected accounts.
 - Account amount: The dashboard will display balances on the selected account: debit, credit, or total.
 - Actor: Up to 20 accounts can be added for display on a single dashboard. You can also change the position of the account using drag-and-drop, affecting its placement on the dashboard.
 - Use actor's color: If checked, the dashboard will use actor colors; if not, random colors from the library will be used for dashboard construction.
 - Display the total: If checked, the dashboard will display the total, which is the automatically calculated sum of all added metrics. If not checked, the total will not be displayed.

#### 2. Added the ability to export transactions and transfers along with accounts.
   This is an optional feature configured in the Import & Export section -> Export -> Edit (on an already formed selection). Check the "Export accounts with transactions and transfers" option.
#### 3. Implemented an error page. In case the service is not working, the user will be directed to this page with the option to refresh it.
#### 4. Set the default graph and layer name based on the name of the first actor added to the layer.
#### 5. Improved the rename function throughout the system.
#### 6. Added a search function for extra parameters in the transaction list interface.
#### 7. Enabled customization of actor images added to the graph. To do this, go to the contextual menu of the actor-image on the graph -> Customize image. Available actions include changing opacity, bringing to the front or sending to the back, and resizing.
#### 8. Added an "Invite users" button in the left sidebar for quick user collaboration.
#### 9. Added an API icon for users. Now, near the API user's avatar in any part of the system, a mini API icon is displayed to quickly visually distinguish regular users from API users.
#### 10. Scripts: Added support for the "skipSubmitOnChange" parameter to all components that support "submitOnChange." To ignore the next "submitOnChange," set "skipSubmitOnChange": true in the changes for the relevant component. To stop ignoring, set "skipSubmitOnChange": false. After ignoring a submit, the component will work in standard mode.
#### 11. Implemented the ability to export the entire workspace. This can be done in the Import & Export section. Workspace export is available for roles Owner and Admin. It exports all entities in the workspace without additional access rights checks. The generated file will be no different from the one formed during partial export and can be imported into another workspace or environment.
#### 12. Improved export considering the case when deleted actors are present in the data of an actor. Now, in such cases, there will be no error, and the export will proceed based on the "as is" principle, and it will be imported the same way.
#### 13. Bugfix: Fixed a bug where file export failed due to permissions granted to a group.
#### 14. Bugfix: Fixed UI bugs in the actor card constructor and its display on the graph.


## [0.3.24] - 2023-08-19
### Helm changes
- Add `apiGateway` parameter in `server` configmap
- Applications versions:
    server - 5.27.2
    frontend - 5.27.0
    realtime - 3.0.3
    control-tasks - 2.8.0
    widget - v1.4.0

#### Improvements
[Release notes Simulator (5.25.0)](https://doc.corezoid.com/docs/simulator-5250) 02.08.2023
1. Implemented the Actor card view functionality. You can configure the actor card on the actor creation/edit form under the "Actors Card" tab. In the constructor, you can specify what information from the actor will be displayed on the card. Available options include:

Avatar
Preview of any selected layer
Account balances (up to 3)
Actor fields (up to 2)
Actor description
+ You can add a button that will trigger a selected online chat widget.
To open an actor's card on the graph, select "Show actor card" from the context menu. This way, for selected actors, their card can be displayed on the graph, providing more informative content than just avatar + title.
2. Implemented graph loading from cache. While synchronization of changes is ongoing, the graph is available in read-only mode. After synchronization is complete, the graph can be edited. This is done to speed up the loading of large graphs.
3. Started adding actor change history:
Event about sharing rights during actor creation.
The initial value of a field.
Scripts
1. Added the ability to embed a comments widget in scripts.
To do this:

In the script constructor, add the actorId of the comments widget to the widgets file:
```
{ "ctrlSettings": Unknown macro: \{ "webComments"}
}
```

To add the comments widget to a page, add a widget component of type webComments. [Script Widget Documentation](https://control.events/script.html#tag/widget)
2. Introduced a new OTP component - [OTP Component Documentation](https://control.events/script.html#tag/otp)


[Release notes Simulator (5.26.0)](https://doc.corezoid.com/docs/simulator-5260) 09.08.2023
1. Added a progress bar when adding images to a layer.

Bugfix
1. Fixed an issue with duplicating actors when moving them between layers.
2. Fixed the display of dropdown lists when they were hidden behind a form. They should now open above the form.


[Release notes Simulator (5.27.2)](https://doc.corezoid.com/docs/simulator-5270) 19.08.2023
1. Implemented an API endpoint for uploading base64-encoded images:
`/upload/base64/{accId}`
Input data example:

```
{ "file": "iVBORw0KGgoA...", "originalName": "fileName.png" }
```

2. Enabled the ability to edit currencies for all users who have the permission `ACCOUNTS_MANAGEMENT` in the single space.

Bugfix
1. Fixed a case where sharing did not work when cloning an actor if a participant was removed from the workspace.
2. Fixed errors that occurred when editing a transaction filter.
3. Fixed email sending when creating a new event in https://admin.control.events/.


## [0.3.23] - 2023-07-26
### Helm changes
- Switch to a public `redis` image
- Add new parameter to `opentelemetry` - `enabled: false|true` to off|on tracing (view values.yaml -> opentelemetry)
- Chage `initialDelaySeconds` for server `readinessProbe` and `livenessProbe`
- Applications versions:
    server - 5.24.0
    frontend - 5.24.0
    realtime - 3.0.1
    control-tasks - 2.5.1
    widget - v1.1.1

#### Improvements
1. Created a comments widget. Instructions for use: https://drive.google.com/file/d/1bAmjjej__DSSnCza1rqQ5L-_zWGlkFXR/view

2. Export/Import. In the form builder, as a data source for dropdown and multiselect fields, you can choose "Account names" and "Currencies." We improved the export functionality to recursively fetch accounts and currencies during the export process, and after importing, they are replaced with the corresponding newly created accounts and currencies in the actors.

3. Moved starred events from the sidebar menu to the system stream named "Starred."

4. Implemented recursive updating of account balances based on formulas. If there is a chain of dependent formulas, updating the balance at the bottom account will trigger updates for all dependent formula balances in the chain going upwards.

5. Implemented the functionality for transfers. This can be found in the "Transfers" section under the "Simulator" menu. A transfer allows moving funds from one actor's account to the account(s) of one or more other actors (with a limit of 20 recipients per split). For a transfer to be successful, all transactions generated by the transfer must be carried out atomically. If at least one transaction fails (e.g., due to a limit on the account), the transfer will not occur. Transfers are only possible between accounts with the same currency. In the "Transfers" section, you can create transfers, view the list of transfers, apply quick filters, or configure and pin more complex ones. It's also possible to view all details of a specific transfer.

6. Added the "transferId" field in the "transactions" section. If the field is not empty, it indicates that the transaction was generated by a transfer.

7. Renamed the "Bets" section to "Events" and correspondingly "bet" to "event."

8. Developed the backend for account balance-based dashboards. This functionality will be available in upcoming releases.

Scripts:
1. Added a response protocol to the sync API with code 205. In response to "/send," it is now possible to specify the command "redraw the page with the new viewModel" without refreshing the page completely. This implementation allows for restructuring and replacing the contentLoop of the page. https://control.events/script.html#tag/send-form
2. Fixed a bug that prevented real-time functionality from working after switching to the nextPage.


## [0.3.22] - 2023-07-12
### Helm changes
- Add `opentelemetry` for future monitoring
- Add `linkedInPartnerId` and `metaPixelId` optional parameters
- Applications versions:
    server - 5.22.0
    frontend - 5.22.1
    realtime - 3.0.0
    control-tasks - 2.4.0
    widget - v1.0.50

#### Improvements
1. Added functionality for group sharing of actors on the graph. Select multiple actors using Shift or lasso -> Share access and grant access rights.
2. Newly created actors are now immediately added to the Recent section in Actors bag.
3. Added support for formula calculations over a period of time.
4. Implemented backend for transfers (transactions between multiple actors). A new section called Transfers will be available in future versions
5. Created an API filter for parameters of nested actors.
6. Implemented an API for searching by "ref" in nested actors.
7. Started adding the newly created actor to the "Recent" section in the Actors bag.
8. The text field does not resize during event description editing.
9. By default, the workspace owner is granted "Edit" permissions for actors.
10. Fixed the bug that prevented entering numbers with a dot or comma in the "amount" field of the transaction creation form.

Scripts
1. Added screenshots and more descriptions to each component in the documentation.
2. Added a Style section to the documentation - https://control.events/script.html#tag/style - providing an example of how to change the color theme for your script. Also added CSS support to components that previously did not have it.
3. Added input mask support for the Edit component.
4. Added a script protocol parameter for controlling the opening of external links (in a new or current tab).
5. Enabled the execution of changes on submit for any forms on the page. (Previously, changes could only be made to the form on which the submit occurred). The changes object should include a formId parameter for executing such changes.
Example:
```
{
  "code": 200,
  "data": {
    "changes": [
      {
        "id": "componentId",
        "formId": "anotherFormId",
        "visibility": "hidden"
      }
    ]
  }
}
```
6. Added support for resettable (removing selected value) in the select component - https://control.events/script.html#tag/select.
7. Integrated with Onfido (Digital ID Verification) at the widget component level.
https://control.events/script.html#tag/widget -> type: onfido
8. Enabled applying changes to the extra attribute in the widget component.
9. Added the "copy" component. The copy chip allows copying information to the clipboard. It can also be used within the table component. https://control.events/script.html#tag/copy
10. Added tooltips to all folders and objects within folders in the script constructor.
11. Added more examples in the style of: https://control.events/script.html#tag/style


## [0.3.20] - 2023-06-21
### Helm changes
- Removed subchart for `Cron` and cron's parameters
- Renamed `postgres-secret` and `postres-secret-root`
- Add `annotations` in Secret for postgres
- Add new parameter in values file for postgres annotation `.Values.global.control.secret.postgres.annotations`
- Add `https://*.onfido.com` in `Content-Security-Policy`
- Applications versions:
    server - 5.19.0
    frontend - 5.19.0
    realtime - 2.0.0
    control-tasks - 2.2.0
    widget - v1.0.47

#### Improvements
1. Implemented Triggers functionality.
Triggers are used to receive signals (via webhook API Key) about reaching target balances or transaction counts on accounts.
A Trigger is an actor created in the system as AccountTriggers.
A Trigger can be applied to an account balance or transaction count, as well as total, debit, or credit.
A Trigger can have an end date, which is the date after which the trigger conditions will no longer be checked.
A Trigger can be checked periodically.
Triggers are divided into three zones: lower, normal, and upper. The zone settings are controlled by the parameters: Lower target value and Upper target value.
Once a change in the zone occurs, corresponding to a change in the account balance or transaction count, a webhook with type "trigger" is sent with signal details.
Triggers are added only to the accountName_currency pair. Therefore, any actor associated with that pair will have the trigger applied.
To use a Trigger, access needs to be granted to the API key for the accountName_currency pair and the Trigger actor.
In the interface, the trigger history can be viewed. To access the history, click on the Trigger history icon next to the accountName_currency parameter added to the actor. Alternatively, select the Trigger history section in the Trigger actor's menu.
In the history, the delivery status of the webhook can be viewed, along with the details that were sent, and the signal can be resent.

2. Increased the limit for sending atomic transactions to 20 per request. https://control.events/api.html#operation/createTransactionAtomic

3. Optimized/improved the search for actors and forms in the interface.

4. Implemented a balance display format - seconds. It can be configured in the accountName_currency pair creation/edit interface.
The account balance is converted to seconds.
For example:
Balance: 100 - Displayed as 1 min 40 sec
Balance: 3600 - Displayed as 1 hour
Balance: 86,401 - Displayed as 1 day 1 sec

5. Updated the component for working with emojis in the interface and fixed bugs related to emoji usage.

6. Added a method description for creating an accountName_currency pair to the documentation. https://control.events/api.html#operation/postAccounts

Scripts:
1. Modified the settings for authorization of anonymous users to allow embedding the anonymous script (Anyone with the link) as an iFrame on any websites.

2. Implemented the ability to customize the preloader on scripts using CSS:
.progressBar

{ color: red !important; }

Widget:
1. Added the ability to pass the real IP address of the user accessing via the widget in the meta info.

2. Implemented a callback system for the widget events:

When the messenger is opened, you can hook into the event using the following function argument:
```
ctrl('webWidget', 'onOpen', function() { // Do stuff }
);
```

When the messenger is closed, you can hook into the event using the following function argument:
```
ctrl('webWidget', 'onClose', function() { // Do stuff }
);
```


## [0.3.19] - 2023-06-08
### Helm changes
- Applications versions:
    server - 5.17.0
    frontend - 5.17.2
    realtime - 2.0.0
    control-tasks - 2.1.0
    widget - v1.0.45

- `Cron` application is deprecated in current helm version. Before `helm upgrade ...` in values file set `.Values.global.control.cron.app_enabled` to `false`.
- Reatime: Add port for metrics. Can set `.Values.global.control.realtimeMetricsPort` or will be use default port `9100`
- Ingress: Add
```
more_set_headers X-Real-IP $remote_addr;
more_set_headers X-Forwarded-For $http_x_forwarded_for;
```
for forward real user IP in widget.

#### Improvements
1. We have implemented the functionality for group actions on Accounts.

In the Accounts section, you can select multiple accounts and grant access rights to all pairs associated with these accounts in bulk. Please note that access will only be granted to those pairs for which you have the Edit permission.
If you navigate inside a specific Account, you can select multiple pairs and mass assign access rights to them or manage tags for these pairs in bulk.
2. We have introduced access rules mapping during the import of .graph files.
This feature allows you to inherit the access rights that were present in the exported file onto users and groups within the workspace where the import is being performed.
Mapping can be performed in a one-to-many manner.

3. In all sections where group actions are available, we have implemented the Multiple choice feature using the Shift key.

4. We have developed a real-time expiration script for scripts running in events.

5. We have added the functionality to drag and drop images onto the graph.

6. We have replaced the control-crons service with control-tasks. This service is responsible for executing asynchronous tasks. It is more optimized than its predecessor.

7. Added a comment stream on the graph:

Layer's reactions: reactions related to the layer itself.
Comment area: a stream of events with their comments created on this layer using the lasso tool.
To open the stream, click on the "Stream" button on the bottom panel while on any layer.
7.1. When creating an event using the lasso tool, a modal window now opens with a standard event creation form. This allows us to manage access rights to different events on the same layer.

8. Added the ability to quickly switch between periods in transaction filters in the Transactions section. Switching is done using the < or > arrows. For example, if a 30-day period is selected and the arrow is pressed, the period will change forward or backward by 30 days in a single click, and the corresponding data list will be loaded.

9. Added an API method to retrieve accounts for a list of actors.

10. Implemented the backend for triggers on accounts. The functionality will be available in the next release on production.

11. Fixed a bug.

Scripts:
1. In the notifications component, we have enabled line breaks in notifications.

2. Added tooltip support as a property for components like labels and buttons. https://control.events/script.html#tag/label

3. Implemented real-time functionality in Scripts:
How it works: The server (Corezoid) can call the public API to send a real-time package of changes to a specific user on a specific script page.
Any changes supported by the script protocol can be passed in real-time, including changes, notifications, and ctrl.
Example request:
POST
{baseUrl}/pages/realtime/{scriptActorId}/{env}/{page}

baseUrl: The host of the public API (e.g., https://api.control.events/v/1.0)
scriptActorId: The actorId of the script
env: production or develop
page: The identifier of the page (e.g., index)

Body:

```json
{
    "data": {
        "changes": [
            {
                "id": "component-id",
                "formId": "info"
            }
        ],
        "notifications": [
            {
                "title": "t1",
                "type": "success"
            }
        ],
        "ctrl": [
            ["q", "w"]
        ]
    },
    "receivers": [
        {
            "userId": 1
        }
    ]
}
```

 - changes: Follows the protocol specified at documentation https://control.events/script.html#operation/sendForm. The difference is that the formId parameter is required in each object. This allows making changes to any form on the same page using real-time.
 - notifications: Follows the protocol specified at
 - ctrl: Follows the protocol specified
 - receivers[].userId: Retrieved from requests: `sessionData.userInfo.id`. Multiple active script users can be targeted with a single request.

The response to the request will always be 'ok', even if the client did not receive the package of changes. For example, if the browser tab is closed or the user is already on another page.

*The user's API must have access to scriptActorId to execute these requests.*

Widget:
1. Removed the display of reactions (Signed, Done, Rate) in the widget. The corresponding text messages are now displayed instead of labels.
2. Removed the automatic zoom-in of the chat widget when opened on iOS.

## [0.3.18] - 2023-05-31
### Helm changes
- New applications versions:
    server/cron - 5.15.2
    frontend - 5.15.1
    realtime - 2.0.0
    widget - v1.0.43

#### Improvements
1. Implemented actor copying functionality.
1.1. The Actors bag provides 2 options:
Make copy: creates a single copy of an actor.
Multiple copy: specifies the number of copies, from 1 to 50, and launches an asynchronous process to create the required number of copies.
1.2. Scripts: Only the Make copy option is available, which also copies the script content (pages, config, locale) and Corezoid process connection parameters.
1.3. Communications: Only the Make copy option is available, working similarly to the Actors bag.
When creating a copy of an actor, its ref, links, access rights, and attachments are not copied.
However, the access rights from the form will be inherited, as in the normal actor creation conditions.
2. By default, when granting access rights to workspace objects to the workspace owner, all access rights are given.
3. Added functionality to create a new workspace from the Simulator interface, without switching to Single space.
4. Updated the Manage access rules form. The Done button is inactive until Add is pressed.
5. Bug fix implemented.

Widget
1. Implemented functionality to confirm that the conversation will not be anonymous:
If a user accesses the chat widget installed on any website and already has an active session in that browser at https://admin.control.events/, they will see a window where they can choose to:

Start an anonymous conversation
Start a conversation under the current account
This determines how the user profile will be displayed in the operator's admin panel (anonymously or not).
2. Styled the system button "New Conversation" to match the widget's color.
3. Added support for SSO authentication in the widget. Instructions for usage will be available in the upcoming documentation releases.
4. Fixed a bug with chat activation on certain screen resolutions of mobile devices.
Scripts
1. Added hotkeys for undo/redo in the script editor.
2. Implemented backend support for real-time script execution. The functionality will be available in upcoming versions.
3. Bug fix implemented.


## [0.3.17] - 2023-05-25
### Helm changes
- New applications versions:
    server/cron - 5.14.0
    frontend - 5.14.1
    control-tasks - 1.0.13
    realtime - 1.1.6

- Add new parameter `.Values.global.control.cron.app_enabled` for future switch from `cron` to `tasks` (need add to values file with `true` value, e.g. `app_enabled: true`).
- Add new parameter `Values.global.control.server.allow_autotests` for future autotest (no change in `values.yaml` need)

#### Improvements
 1. In the Actors bag settings form, a new field called "owner" has been added to the filters. This allows filtering actors based on their owner.
 In the public API "actors_filter," a new field called "ownerId" has been added.
 2. Transactions now include additional fields: "account_hold_amount" and "available_amount," providing more details about the transaction.
 3. The default size of the actor's sidebar panel has been increased. There is no longer a horizontal scroll on the tabs.
 4. Various bug fixes and optimizations have been implemented, resulting in improvements and enhancements.


## [0.3.16] - 2023-04-03
### Helm changes
- New applications versions:
    server/cron - 5.12.0
    frontend - 5.12.1
    control-tasks - 1.0.11
    widget - v1.0.42


## [0.3.15] - 2023-04-03
### Helm changes
- New applications versions:
    server/cron - 5.12.0
    frontend - 5.12.1
    control-tasks - 1.0.11
    widget - v1.0.42

- Add new block in `control-tasks` to work with `http` protocol (use `https://` by default):
```
"protocol": "{{ .Values.control.protocol | default "https://" }}"
```
- Add new block in `control-tasks` to work with insecure ssl certificate (use `false` by default):
```
"insecure_skip_verify": "{{ .Values.control.insecure_skip_verify | default "false" }}"
```
- Add files `monitoring.yaml` for tasks, frontend, realtime, server templates and defines for future monitoring.

#### Improvements
1. User profile functionality has been implemented to establish communication between any actor in the workspace and the user. In the left sidebar, a Profile section has been added, which is a system layer of an actor associated with the user. By default, it is a default actor without custom parameters.
To change the association of the user with an actor, you need to enter the edit mode of any actor, toggle the Optional fields switch, and fill in the Single account user field. This field displays all the users in the workspace.
The following conditions must be met to perform the association change operation:
- The user making the changes must have the "The right to modify system actors" permission in the Single space.
- The user must have the rights to modify the actor they want to associate with the user.
At any given time, one user can only be associated with one actor.
In places where users are displayed (such as the list of users shared on an object or the object owner), it is now possible to click on a user. If the actor associated with the user is accessible, it will open that actor. If there are no permissions, a short card with system information will be displayed.
1.1. A display mode for any actor has been added to the "Profile" graph. Profile allows for displaying an actor's card directly on the graph without opening the sidebar.
To open an actor as a Profile, you need to right-click on the actor on the graph and select the "Expand profile" option.
2. REF has been added for forms. REF is necessary for future form merging, and it is more convenient to work with than using ID when versioning processes.
3. The ability to search for actors in the Actors bag by actor REF has been implemented. Simply enter the actor REF in the search bar.
4. While configuring sharing for a group, the participant count has become clickable. Clicking on it displays a list of all participants.
5. In the Forms section, a search by form ID has been added.
6. An API method has been implemented for deleting files. https://control.events/api.html#operation/removeAttachment
If a file is attached to an actor, it cannot be deleted directly. First, the actor must be deleted.
7. The filter query parameter has been added to the following methods: https://control.events/api.html#operation/getLinked and https://control.events/api.html#operation/getLinkedActors
8. Formula-related issues have been fixed:
- The balance of an account with a formula now updates on the graph.
- The balance of an account with a formula updates without the need to re-save the formula.
9. Fixed a bugs.

#### Widget:
1. The size of user avatars in the widget has been increased.
2. The size of the text input field in the widget has been increased to accommodate up to 5 lines.

#### Widget:
1. The select component, type: autocomplete, has been improved. A 0.5-second delay has been added after text input completion before sending a "send" request to Corezoid.


## [0.3.14] - 2023-04-19

### Helm changes
- New applications versions:
    server/cron - 5.10.2
    frontend - 5.10.0
    control-tasks - 1.0.11

- Removed from server and cron configmaps next parameters:

```
browserExtensionsSecret
googleApiKey
locales
session:
  ttl:
  cookieName:
connectors:
  syncApiUrl:
corezoid:
    apiSecret:
    companyId:
    processes:
        sendEmail:
            convId:
        accRegistrations
            convId:

channels:
  gmail:
    clientId:
    clientSecret:
    ignoredDomains:
```

#### Improvements
1. Created user Groups.
1.1. Purpose of groups: for more convenient and fast management of access rights to system objects.
1.2. How to work with groups:
1.1.1. Groups can be created and users added to them in Single Space -> Groups.
1.1.2. When sharing access rights to any objects in the system, it is now possible to choose individual users or groups.
1.1.3. Access rights are merged if a user is in multiple groups or added separately.
1.1.4. API Keys can be added to groups.
1.1.5. If a user is added to a group, all objects in the system shared with that group will immediately become available to them.
2. Added the ability to configure a filter in the Actors bag interface based on the updatedAt field.
3. Added the ability to filter actors only by nested forms (based on the presence of some nested form in the actor).
4. Implemented real-time event addition to the stream based on the "creation of a link between actor-event and actor-stream" trigger.
5. We have resolved bugs

#### Widget:
1. Removed scrolling from the preloader script that runs in the widget.


## [0.3.13] - 2023-04-12

### Helm changes
- New applications versions:
    server/cron - 5.9.0
    frontend - 5.9.0
    widget - v1.0.38

#### Improvements
1. Added the ability to use ">" and "<" in actor filters for custom fields with calendar type.
2. Increased the size of the All forms window in Actors bag. Added a preloader when searching for forms.
3. Added a tooltip when hovering over the workspace name in the workspace list.
4. Fixed the display of the actor count in the filter.
5. We have resolved bugs.

#### Scripts
1. Added examples of dateFormat to the documentation: https://control.events/script.html#tag/edit


## [0.3.12] - 2023-04-06

### Helm changes

- Remove service for `control-tasks`


## [0.3.11] - 2023-04-06

### Helm changes

- New applications versions:
    server/cron - 5.8.4
    frontend - 5.8.0
    widget - v1.0.38
- Add `wss://global.vss.twilio.com` to `Content-Security-Policy`
- Fix `service` for `control-tasks` - set correct `targetPort`
- Add possibility to set redis database - `.Values.global.control.redisDb` - set from 0 to 15 (default: 0 )

#### Improvements
1. Added a new section called "Transactions". This is a separate interface for working with transactions:
On the main screen, there is the ability to apply quick filters by period, account name and currency pair, account type and actors. There is also the ability to search for transactions by reference, comment or transaction ID.
By clicking on "+", a custom filter can be created and pinned to tabs (similar to Actros bag).
For any transaction from the list, you can click on it and go to its separate page to view details and share a direct link with someone.
Updated the "Make transactions" form.
2. Removed the "AllTime" option from the API request for getting the list of transactions. If no "from" and "to" parameters are passed in the request, the result will be for the last month of activity on the account.
3. Optimized the API request for searching actors by title and description.
4. Resolved the bugs.

#### Scripts:
1. Integrated with Twilio for embedding video calls in scripts.
Component widget, type: twilio. https://control.events/script.html#tag/widget



## [0.3.9] - 2023-03-29

### Helm changes

- Update `imagePullSecret` - add if require
- New application release

### Application changes
#### Improvements:

1. Refined actor creation on the graph via the "+" button. Now, new actors appear next to the creation form instead of appearing in the center.
2. Added the ability to delete an actor from the account tree without fully removing it from the system.
3. Implemented back-end functionality for user groups.
4. Resolved a bugs.

#### Scripts / Widget:
1. Added a skeleton loader to facilitate script loading in the widget.
Additionally, a regular preloader was added to facilitate script loading in other areas such as events, graphs, and separate pages.


## [0.3.8] - 2023-03-16

### Helm changes

- New application release
- Update Chart.yaml files for applications


## [0.3.7] - 2023-03-01

### Helm changes

- New application release


## [0.3.6] - 2023-02-22

### Helm changes

- New application release


## [0.3.2] - 2023-02-09

### Helm changes

- New application release
- N.B.! For this version you need Single-Account application with Singlespace backend.


## [0.2.6] - 2023-01-19

### Helm changes

- New application release


## [0.2.3] - 2022-12-20

### Helm changes

- Enable `API` variable for `cron` application.


## [0.2.2] - 2022-12-20

### Helm changes

- Update variable `session` for server, cron and realtime.
- Add `liveness` and `readiness` for cron.
- Add `checksum/config` for `cron` deployment.
- Code optimization.


## [0.2.1] - 2022-12-19

### Helm changes

- Add variable `session.cookieName` for cookie for auth.


## [0.2.0] - 2022-12-19

### Helm changes

- Remove `ElasticSearch`. From this version backend don't use `ElasticSearch`.
