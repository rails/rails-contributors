# Rails Contributors design

## Main design guidelines

* Rails Contributors is not about Rails, the project, it is about Rails contributors. People are first and this has to be reflected in the interface.

* All contributors are credited in the home page. In particular, listings are not paginated.

* Rails Contributors is not meant to be a ranking, but the interface revolves around commits because that's the most natural unit of work you can credit for.

* Rails Contributors is not meant to be a ranking, but there is a number that gives context about how active someone has been when browsing listings others than the global one.

* Auto-healing: Fixing credits and adding new mappings is very common, the application should handle this gracefully, detecting and merging accounts as needed automatically on deploy.

* The application updates the database on every Rails push via a webhook in GitHub. Should detect which commits are new since the last run and import them efficiently.

* Contributors are identified preferably by their real name.

* At any point in time, the application should be able to credit all people from a local Rails checkout and an empty database.

* It is impossible to give credit with 100% accuracy on the entire Rails history due to a number of reasons. Accept that, and do your best.

* Page cache everything.

## Credit algorithm

The logic used to give credit to a given commit is in the method `Commit#extract_candidates`.

## Main entities

* [`Repo`](../app/models/repo.rb) knows how to update the local Rails checkout and update the database crediting people. New mappings are handled automatically. `Repo.sync` is the external entry point that needs to be executed in production with the `runner` command when the webhook is triggered.

* [`Contributor`](../app/models/contributor.rb) and [`Commit`](../app/models/commit.rb) represent contributors and commits. Since the application supports multiple authors for a commit, they are connected by the [`Contribution`](../app/models/contribution.rb) join model.

* [`NamesManager`](../app/models/names_manager.rb) is responsible for handling false positives, mappings, etc. This module is split in three for code organization.

* [`Release`](../app/models/release.rb) represent Rails releases and has the code that detects and imports them.
