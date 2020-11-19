# OG Protocol Tester

A simple web page where a user can enter a url and then preview & test opengraph data. Rails without a DB.

## Table of Contents

- [Installation](#installation)
- [Usage](#usage)
- [Features](#features)
- [Roadmap](#roadmap)
- [Notes](#notes)

## Installation

Download with `git clone https://github.com/Reeseman/og-protocol-tester.git`, and then in the project directory:

- Make sure you have the ruby version specified in `.ruby-version`
- Make sure you have rails installed. The version is specified in Gemfile.lock, currently (6.0.3.4)
- Webpacker/yarn has to be installed too. I ran `brew install yarn`
- Finally, run `bundle install`
- If all goes well, run `rails s`, and check out what's hosted on `localhost:3000`.

## Usage

Go to `localhost:3000` and try entering a url. The URL must be complete, so

Cases:
- URL is invalid: you should simply get a small error message that says the url is malformed. The validity is done with open-uri's `URL.regexp` regex.
- URL is valid but there is no og data: you will simply get an error message saying so.
- URL is valid with og data: You should see a preview of the image. If the image size is specified in the webpage by meta properties `og:image:height` and `og:image:width`, then the image will be scaled to that size. Otherwise, the image size will not be limited. You will also see a bulleted list with all of the og data. Since we are supposed to be testing the og protocol I thought this would be helpful and interesting.

## Features

- The page does not reload the whole page each time, I was able to get partial loading
- Three cases for urls covered (invalid, valid without og, and happy path)
- Extra bulleted list of information not listed in the prompt
- The image scales based on the page's own og data

## Roadmap

- The calls for the entered URLs are unfortunately synchronous. I did this because I am much more familiar with backend. This is an almost entirely frontend project (there's not even a db!), which made me want to give the work to a controller's interactor. If I were to do it again I'd simply use AJAX instead of calling the urls server-side. This is the most major flaw with the project.
- Since the calls are synchronous, I didn't see the need for a database at all. It just sends the data right back to the client.
- It ain't that pretty. Could use beautification

## Notes

There was a miscommunication with the prompt. I was sent a small snippet of the prompt, and I thought that was the whole thing. I didn't see the full prompt until after I was done with the project! Asynchronous calls are probably the obvious choice for your typical FE/FS web dev, and they would have done it that way even without the prompt, but as it stands, if the given url hangs, so does the web page. I timeboxed this project to about five hours total, so this is what I have to show.
