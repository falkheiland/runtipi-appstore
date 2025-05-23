# Authentik

The authentication glue you need.

authentik is an open-source Identity Provider that emphasizes flexibility and versatility, with support for a wide set of protocols.

## Links

<https://goauthentik.io>

<https://github.com/goauthentik/authentik>

<https://ghcr.io/goauthentik/server>

## Installation

The initial installation can take several minutes to complete.

Look at the log display in the `Logs` tab of the Authentik app.

***IMPORTANT: Wait until there are no new log entries created and wait at least 1 additional minute before proceeding ! If the WebUI of authentik is called before the installation routine completes, it will brake the setup!***

Now open the app and modify the browser url as follows:

- change `https` to `http`
- change anything after `/if/` and replace it with `flow/initial-setup/`

then press enter.
