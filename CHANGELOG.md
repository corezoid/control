# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.2.0] - 2022-12-19

### Helm changes

- Remove `ElasticSearch`. From this version backend don't use `ElasticSearch`.

## [0.2.1] - 2022-12-19

### Helm changes

- Add variable `session.cookieName` for cookie for auth.

## [0.2.2] - 2022-12-20

### Helm changes

- Update variable `session` for server, cron and realtime.
- Add `liveness` and `readiness` for cron.
- Add `checksum/config` for `cron` deployment.
- Code optimization.

## [0.2.3] - 2022-12-20

### Helm changes

- Enable `API` variable for `cron` application.

## [0.2.6] - 2023-01-19

### Helm changes

- New application release

## [0.3.2] - 2023-02-09

### Helm changes

- New application release
- N.B.! For this version you need Single-Account application with Singlespace backend.

## [0.3.6] - 2023-02-22

### Helm changes

- New application release

## [0.3.7] - 2023-03-01

### Helm changes

- New application release

## [0.3.8] - 2023-03-16

### Helm changes

- New application release
- Update Chart.yaml files for applications

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
