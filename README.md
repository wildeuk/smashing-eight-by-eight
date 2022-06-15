# smashing-eight-by-eight

## Description

A [Smashing](https://smashing.github.io) widget for displaying 8x8 VCC (Virtual Contact Center) call queue lengths.

![](screenshot URL)

## Dependencies

- You need an account with [8x8](http://www.8x8.com) to use this.
- Your 8x8 tenant must have both X6 & VCC functions available and enabled.
- You will need to create an 8x8 API Data Request Token from the Integration -> API Token page on your VCC admin console.

## Installation

TODO: Write this bit :)

## Usage

Add the widget HTML to your dashboard
```
    <li data-row="1" data-col="1" data-sizex="1" data-sizey="1">
      <div data-id="EightByEight" data-view="EightByEight"></div>
    </li>
```
1. Create a directory titled "eight_by_eight" under your widgets directory and move eight_by_eight.coffee, eight_by_eight.html, and eight_by_eight.scss into that directory.
2. Get your API key from your 8x8 VCC UI and modify the :username (this is your VCC tenant name, found on 'Home->Profile') and :password (this is your 8x8 API Data Request Token) variables of the auth{} hash in EightByEight.rb
3. Grab your queue IDs from Queues/Skills -> Queue List on VCC and enter the ones you want to track into the QueueID array.
4. Move EightByEight.rb into your jobs folder.
