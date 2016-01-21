Hacker News client
=========================

This is a simple Hacker News API client display a set of default criteria:

a. url of the news must contains "github"

b. order them by newest news first

c. Authors “points” must 1000+


## To use it:

### Clone the project
```
git clone https://github.com/shu-nan/hacker_news_client.git
```

### Bundle install
```
bundle install
```

### Launch the website:
```
rails server
```

## User Interface
The news information can be access at http://localhost:3000

The default parameters are:
```
{
  query: 'github',
  restrictSearchableAttributes: 'url',
  tags: 'story',
  numericFilters: 'points>1000',
  hitsPerPage: 10,
}
```

The parameters listed above can be changed by passing in as url parameters.

e.g http://localhost:3000/?numericFilters=points>500

