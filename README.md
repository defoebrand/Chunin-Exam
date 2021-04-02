> This project is a take-home assessment. The task was to build a URL shortener. I have used StimulusJS / Rails / PostgreSQL to set up a key-value database system of unique short URL keys for each unique URL, as well as for storing user data for each click and each short-url creator.

# The Big Short 

## Project Description

This project is a simple URL shortener designed to account for variances in http:// and www. beginnings to common URLs. While https:// and http:// are stored separately, www.google.com and google.com are not. Each unique URL is assigned a 10 character key. Each 10 character key is randomly generated from upper and lower case letters, as well as all digits. Inputting the exact same URL will return the same short key every time. Key collisions are prevented through a recursive key generator.

![screenshot](app/assets/images/screenshot1.png)

#### Features
-   Responsive minimalist layout works well on mobile or desktop
-   Stores data each time a short URL is used 
-   Stores data each time a short URL is created without doubling the created entry 
-   Stores 'http://' and 'https://' as separate entries
-   Adds 'http://' as default if it is not included
-   Scrubs 'www.' from beginning of address to store www.domain.com and domain.com as the same entry
-   Serves as Open API - Requests can send a URL in the body params and have a short key returned.
-   Keys are randomly generated and checked against a master list before being returned. If the generated key is already in use, a new key one character longer is generated, preventing collisions and infinite key generation loops.


###### Coming Features

-   Short URL reverse lookup
-   Invalid URL error handling

## Built With

-   Ubuntu / Atom
-   Front-End: ERB / SCSS / StimulusJS
-   Back-End: Ruby / Rails / PostgreSQL

### To Use The App
-   To shorten a URL type it into the input box and click "Get Shorty"
-   Click the link that appears below the input to copy the short URL to your clipboard
-   Post that URL anywhere you want for an easy to share link to any web reachable resource!

### To Use The API 
-   Send a `POST` request to `https://www.ur-shorty.herokuapp.com/app`
-   Include the URL to be shortened as a parameter like so: `{"url": "www.google.com"}`
-   Receive a `short` key in the response, along with the `url` and the current `click_count` for that short key
-   Append this key to the `ur-shorty.herokuapp.com/` domain like so: `ur-shorty.herokuapp.com/6rHkHDeWXU` and be redirected!


## Live Demo

Click the [Live Link](https://ur-shorty.herokuapp.com/) to visit this site now!

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
Run `rails db:setup` to create the database and load the schema.<br>

**Step 5**<br>
Run `rails s` to begin the server.<br>

**Step 6**<br>
You will have to adjust all instances of 'domain' to reflect the local setup. Check line 39 of the input_controller.js file, as well as relevant views spec files: line 9 of spec/views/with_input_spec.rb & line 20 of spec/views/without_input_spec.rb.<br>

**Step 7**<br>
Navigate to `http://localhost:3000/` in a browser of your choice to see the application running<br>

### Testing
This project uses RSpec and Capybara for testing.
> To run tests open a terminal inside the project's root directory and enter `rspec`

## Additional Description
This project is my first using StimulusJS, and my first attempt at a URL shortener. Originally I attempted to find a algorithm for compressing and encoding a URL but this did not prove to be the generally accepted solution. I moved on to writing a simple key generator but since each key was unique, and the generally accepted solution pointed to doing so, a database of short keys was created.  From there the question arose of where to handle different functions, in the front-end or back-end. At first I created a form using Ruby to send data to the controller but this proved to take too much work away from StimulusJS so a more JavaScript focused front-end was created. To allow for both front-end input and direct to server API input, URL scrubbing functions were created in the back-end and mimicked in the front-end while searching for a best practice. A similar issue arose concerning data analytics. I chose not to use additional libraries for analytics as there are a great number of analytic services to choose from and I wanted this project to focus on my own abilities.  In making this choice I found that some data is easily attainable through the front-end but not so easily attainable from the back-end without those additional libraries. Due to this, user-agent and language data is stored from both places but additional data is stored from the front-end and no data is necessarily stored from API requests. This approach has allowed me to separate users that create short-URLs from users that actually use those URLs, as well as being able to identify which URLs are created through API requests. Additional analytics can easily be added and stored in their respective tables to allow for analysis regarding how users create and share URLs. Tests were created mostly ad-hoc so rewriting was necessary as features were added or changed. For example, the function that stores Creator data broke several tests as analytics were added after they were written. Additionally, new tests are continuously being added as new ways to test this app are discovered. While I do believe in TDD, at this time I find it difficult to know what to test before I've even written the code.


## Author

👤 **Brandon Defoe**

-   Portfolio: [defoebrand](https://www.defoebrand.com)
-   LinkedIn: [@defoebrand](https://www.linkedin.com/in/defoebrand/)
-   Github: [@defoebrand](https://github.com/defoebrand)

## Show your support

If you've read this far....give us a ⭐️!

## :clap: Acknowledgments

-   [@EmirVatric](https://github.com/EmirVatric)
