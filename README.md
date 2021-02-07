# OG Protocol Tester

A simple web page where a user can enter a url and then preview & test opengraph data. Rails without a DB.

## Table of Contents

- [Installation](#installation)
- [Usage](#usage)
- [Features](#features)
- [Roadmap](#roadmap)
- [Notes](#notes)

## Installation

- Clone
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

