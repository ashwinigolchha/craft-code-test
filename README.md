# Code Test (Craft CMS)

This is a light code test created to screen new applicants and their ability to use Craft CMS. The follow tasks will show an applicants ability to read documentation, solve errors in existing code, and use some of Craft's built in tools to achieve a goal.

If you need a local development recommendation:

- Laravel Valet (Mac OS) https://laravel.com/docs/8.x/valet
- Laravel Sail (Docker Based) https://laravel.com/docs/8.x/sail
- MAMP (Mac, Windows) https://www.mamp.info/en/mamp/

## Requirements:

The following are requirements for this test to be submitted and reviewed.

1. Fork this repository, and commit your finished code to your fork. This new repo must be made public and the link submitted to Novigo. This requies a github account.

2. All 3 challenges must be completed.

3. The code has to work. If it does not run, the test does not pass.

4. You have 1 week to complete this test.

5. Any online resources can be used to complete this. Some reference documentation has been linked below, but any documentation may be used.

6. Bootstrap must be included using NPM. It cannot be downloaded from source and added to the repo.

## Installation:

1. Use `composer install` to install craft vendor file

2. Use `npm install` to install npm packages.

3. Create a database for the CMS (using any local method)

4. Setup a new .env file based on .env.example, fill in your own values where applicable

5. Import `starter-db.sql` into the database you created for the CMS

The admin panel can be accessed by going to` /admin`of your local URL. The following credentials will get you into it.

**username:** `admin`

**password:** `codeTestAdmin`



#### Challenge 1:

For this task you will work with laravel-mix and setting up bootstrap for the project to get some base styles working. The project already has a stylesheet, but it won't render correctly until bootstrap is implemented.

- Use npm to install project packages

- Add bootstrap styles to the styles.scss file

- Add bootstrap javascript to the site.js file

- Use mix commands to build styles and JS and make sure they load onto the site successfully. Solve any errors in building.

#### Challenge 2:

For this task you will be working with Craft's entry system, and learning how to work with Sections, Fields, and pulling data on the frontend.

- Install the "Expanded Singles" plugin from https://plugins.craftcms.com/ via Composer and enable it

- Create a new CMS Section titled "Employees". This should be a structure with a depth limit of 1 to allow for entries to be rearranged, but not have children.

- Create fields for First Name, Last Name, and Profile Picture. Add them to the Employee entry type.

- Create 3 employee entries in the CMS with dummy data and images

- Call the 3 employees to the index.twig template, in alphabetical order (by last name, styled however it makes sense with the info required)

#### Challenge 3:

This task involves a basic Content Building system. The "Highlighted Article" block is not showing the title of the selected article on the page "Example". It is simply blank. The page is also giving a twig error for the URL of the same block. Fix the twig code to make it render properly.

- Components can be found in `craft/templates/components`

- Example page is using the "`example.twig`" template

- The CMS entry is using the "`contentBuilder`" field

## Reference Docs:

https://getbootstrap.com/docs/5.0/getting-started/webpack/

https://github.com/dodgycoffee/rachni (laravel-mix build commands, installed on this project)

https://getcomposer.org/doc/01-basic-usage.md

https://craftcms.com/docs/3.x/fields.html
