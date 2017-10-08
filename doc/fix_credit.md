# How to fix credits

## Logic

* Mappings are the most common way to fix a credit. These are appropriate when you want a handler, email, typo, etc. to be mapped to one single canonical real name. These correspondences go in [*app/models/names_manager/canonical_names.md*](../app/models/names_manager/canonical_names.md) and the application merges automatically the commits credited to the mapped string in production when deployed. Please take into account that these mappings are meant to connect handlers and friends which are *present* in the history. Add mappings only if the application has found the mapped string and you can write a test that fails for a particular commit otherwise, this is not a database of people's handlers.

* Occasionally heuristics may give a false positive. Sometimes these are not authors ("Closes #1234"), sometimes they are indeed two people ("Jose and Yehuda"). These are managed in [*app/models/names_manager/false_positives.md*](../app/models/names_manager/false_positives.md).

* In rare cases you need to force the credit. For example, the commit was sent with a generic company account, attribution is given in the commit message with a convention that is not supported, multiple authorship with some people missing, etc. These kind of fixes are implemented in [*app/models/names_manager/hard_coded_authors.rb*](../app/models/names_manager/hard_coded_authors.rb). These are really exceptional, please use this as a last resort.

## Tests

Please, always add a test covering the fixed credit. Suites are found in the respective files in the [*test/credits*](../test/credits) directory.
