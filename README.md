> This project is a take-home assessment. The task was to build a URL shortener. I have used StimulusJS / Rails / SQLite3 to set up a key-value database system of unique short URL keys for each unique URL

# The Big Short 

## Project Description

This project is a simple URL shortener designed to account for variances in http:// and www. beginnings to common URLs. While https:// and http:// are stored separately, www.google.com and google.com are not. Each unique URL is assigned a 10 character key. Each 10 character key is randomly generated from upper and lower case letters, as well as all digits. Inputting the exact same URL will return the same short key every time. 

![screenshot](public/images/screenshot1.png)

#### Features
-   Responsive layout works well on mobile or desktop
-   Provides analytics on number of times a short url has been used

###### Coming Features

-   Short URL reverse lookup

## Built With

-   Ubuntu / Atom
-   Front-End: ERB / SCSS / StimulusJS
-   Back-End: Ruby / Rails / SQLite3

### To Use The App
-   To look shorten a URL type it into the input box and click "Get Shorty"
-   Click link that appears below input to copy the short URL to your clipboard
-   Post that URL anywhere you want for an easy to share link to any web reachable resource!


## Live Demo

Click the [Live Link](https://domain-here/) to visit this site now!

## Getting Started

**To get this project set up on your local machine, follow these simple steps:**
#### Prerequisites

-   Ruby: 2.7.2
-   Rails: 6

#### Setup

**Step 1**<br>
Navigate to the local folder where you want the repository to be cloned and run
`git clone https://github.com/defoebrand/Chunin-Exam.git`.<br>

**Step 2**<br>
Next, run `cd Chunin-Exam`.<br>

**Step 3**<br>
Run `bundle install` to install or update necessary gems.<br>

**Step 4**<br>
Run `rails s` to begin the server.<br>

**Step 5**<br>
Navigate to `http://localhost:3000/` in a browser of your choice to see the application running<br>

### Testing
This project uses RSpec and Capybara for testing.
> To run tests open a terminal inside the project's root directory and enter `rspec`

## Author

👤 **Brandon Defoe**

-   Portfolio: [defoebrand](https://www.defoebrand.com)
-   LinkedIn: [@defoebrand](https://www.linkedin.com/in/defoebrand/)
-   Github: [@defoebrand](https://github.com/defoebrand)

## Show your support

If you've read this far....give us a ⭐️!

## :clap: Acknowledgments

-   [@EmirVatric](https://github.com/EmirVatric)
