# DMS qmldir files

For some reason DMS (dankmaterialshell) doesn't include qmldir files on their project, which makes plugin dev using qmlls near impossible. So here are some qmldir files I made

The provided script can be run using nushell to generate qmldir files.
It must be run with the cwd set to the root of dms. Additionally, it does not add singleton comments (these have to be manually added). But it at least gets us closer to the end.
