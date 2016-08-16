---
title: API Reference

language_tabs:

toc_footers:
  - <a href='https://github.com/michaellennox/ma_alumni'>Contribute on Github</a>
  - <a href='https://www.pivotaltracker.com/n/workspaces/639069'>Product Roadmap on Pivotal</a>

includes:
  - graduates
  - job_surveys

search: true
---

# Introduction

Welcome to the MA Alumni API! The API powering our super-application which is intended to replace data gathering via google forms and docs with a wonderful JS and Elixir/Phoenix solution which we can extend, grow and use to analyse the information that graduates provide us over a much wider scope.

### Anonymity

All graduate data should be anonymised and there is no link between the data a user provides and their name except on the initial POST request to save form data. No GET requests should combine the graduate's name with any sort of information they have submitted to us.

### In Development

The API is currently in active development and as such, breaking changes may be introduced.

### Get Involved!

We are actively looking for people to contribute to the application, our github repository can be found [here](https://github.com/michaellennox/ma_alumni) and our kanban boards can be found at [here](https://www.pivotaltracker.com/n/workspaces/639069).

Have some ideas of great visualisations or data that would be awesome for us to collect? [Raise an issue on github](https://github.com/michaellennox/ma_alumni/issues), [create a ticket on pivotal](https://www.pivotaltracker.com/n/workspaces/639069) or even better, write it and open a pull request!

# JSON API Compliant

The goal of this API is intended to be compliant with the schemas outlined by [JSON API](http://jsonapi.org/) in all cases apart from ones that would risk the anonymity of data. All requests to the API should follow the JSON API schema.

Please note that all requests to the API should use the JSON API mime type `application/vnd.api+json`.

To find a list of clients which make interacting with a JSON API compliant api a smooth doddle please visit [jsonapi.org/implementations](http://jsonapi.org/implementations/).
