# USCADC Recent Opinions

## Setup

Clone this repo:

```bash
git clone git@github.com:alfredormz/opinions.git
```

## Installation

Requirements: ruby 2.1.1

```bash
cd opinions
bundle install
```

## Usage:

To create the `results.json` file 

```ruby
rake opinions:dump
```

## Run the server

```
cd opinions
rails server
```

Then go to `http://localhost:3000/opinions.json` on your browser. You can also pass the year and month as parameters.

Examples:

```
http://localhost:3000/opinions.json?year=2015 #current month of 2015
http://localhost:3000/opinions.json?year=2014&month=5 #May 2015

```

For a user friedly version simply type http://localhost:3000
