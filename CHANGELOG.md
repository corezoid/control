# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.3.17] - 2023-05-25
### Helm changes
- New applications versions:
	server/cron - 5.14.0
	frontend - 5.14.1
	control-tasks - 1.0.13
	realtime - 1.1.6

- Add new parameter .`Values.global.control.cron.app_enabled` for future switch from `cron` to `tasks` (need add to values file with `true` value, e.g. `app_enabled: true`).
- Add new parameter `Values.global.control.server.allow_autotests` for future autotest (no change in `values.yaml` need)

#### Improvements
 1. In the Actors bag settings form, a new field called "owner" has been added to the filters. This allows filtering actors based on their owner.
 In the public API "actors_filter," a new field called "ownerId" has been added.
 2. Transactions now include additional fields: "account_hold_amount" and "available_amount," providing more details about the transaction.
 3. The default size of the actor's sidebar panel has been increased. There is no longer a horizontal scroll on the tabs.
 4. Various bug fixes and optimizations have been implemented, resulting in improvements and enhancements.


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
- Remove `Service` for `control-tasks`.

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
