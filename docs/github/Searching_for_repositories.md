# [Searching for repositories](https://docs.github.com/en/github/searching-for-information-on-github/searching-for-repositories#search-by-repository-name-description-or-contents-of-the-readme-file)

##### [docs.github.com](https://docs.github.com/)

> You can search for repositories on GitHub and narrow the results using these repository search qualifiers in any combination.
> In this article good first issue help wanted
> You can search for repositories globally across all of GitHub, or search for repositories within a particular organization.
> For more information, see "About searching on GitHub."
> To include forks in the search results, you will need to add or to your query.
> For more information, see "Searching in forks."

`fork:truefork:only`

Tips:
`label:"in progress"`

With the qualifier you can restrict your search to the repository name, repository description, contents of the README file, or any combination of these.
When you omit this qualifier, only the repository name and description are searched.

#### in

`in:name`
`in:description`
`in:readme`
`repo:owner/name`

You can find a repository by searching for content in its README file, using the qualifier.

`in:readme`

Besides using , it's not possible to find repositories by searching for specific content within the repository.
To search for a specific file or content within a repository, you can use the file finder or code-specific search qualifiers.
For more information, see "Finding files on GitHub" and "Searching code."

`in:readme`
`in:readme`

To search in all repositories owned by a certain user or organization, you can use the or qualifier.

#### userorg

`user:USERNAME`
`org:ORGNAME`

The qualifier finds repositories that match a certain size (in kilobytes), using greater than, less than, and range qualifiers.

#### size

`size:n`

You can filter repositories based on the number of followers that they have, using the qualifier with greater than, less than, and range qualifiers.

#### followers

`followers:n`

The qualifier specifies the number of forks a repository should have, using greater than, less than, and range qualifiers.

#### forks

`forks:n`

You can search repositories based on the number of stars a repository has, using greater than, less than, and range qualifiers

`stars:n`

You can filter repositories based on time of creation or time of last update.
For repository creation, you can use the qualifier; to find out when a repository was last updated, you'll want to use the qualifier.
The qualifier will return a list of repositories, sorted by the most recent commit made on any branch in the repository.

`created
pushed
pushed`

Both take a date as a parameter.
Date formatting must follow the ISO8601 standard, which is (year-month-day).
You can also add optional time information after the date, to search by the hour, minute, and second.
That's , followed by (hour-minutes-seconds), and a UTC offset ().

`YYYY-MM-DDTHH:MM:SS+00:00THH:MM:SS+00:00`

Dates support greater than, less than, and range qualifiers.

`created:YYYY-MM-DD`
`pushed:YYYY-MM-DD`

You can search repositories based on the main language they're written in.

`language:LANGUAGE`

You can find all of the repositories that are classified with a particular topic.

`topic:TOPIC`

You can search repositories by the number of topics that have been applied to them, using the qualifier along with greater than, less than, and range qualifiers.

####topics

`topics:n`

You can search repositories by their license.
You must use a license keyword to filter repositories by a particular license or license family.

`license:LICENSE_KEYWORD`

You can filter your search based on whether a repository is public or private.

`is:public`
`is:private`

You can search repositories based on whether or not they're a mirror and are hosted elsewhere.
For more information, see "Finding ways to contribute to open source on GitHub."

`mirror:true`
`mirror:false`

You can search repositories based on whether or not they're archived.

`archived:true`
`archived:false`
`good first issue` 
`help` 
`wanted`

You can search for repositories that have a minimum number of issues labeled or with the qualifiers and.
For more information, see "Encouraging helpful contributions to your project with labels."

`help-wanted`
`good-first-issue`
`help-wanted-issues:>n`
`good-first-issues:>n`
`good-first-issues:>n`
`good-first-issue`
`help-wanted-issues:>n`
`help-wanted`

