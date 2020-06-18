# Project Comments

## Migration Tables

- [ ] Add "[5.2]" to the end of the first line. This is the ActiveRecord version you have locked in your Gemfile and for some dumb reason you need to specify the version for each of you migration tables.

## Forms

- [ ] Clean up placeholders (capitalize words, remove colons)

## Sign Up Flow

- [ ] Once the user signs up, they shouldn't be able to see the "Sign Up" link anymore.
- [ ] Part of the POST users route is logging the user in to the app. It goes against the single responsibility principle but it's a lot more convenient for the user than signing up than having to log in right after.

## User Show Page

- [ ] You may want to add a "Create a new book" button to this page as well. A new user logging in just sees "Here are your books that you can view/edit {NAME}." and then nothing.

## New Book Form

- [ ] The "status" attribute is unclear. I'm assuming it means read vs. unread? That input might work better as a drop down or radio button selection depending on what you had in mind for status.

## Edit Book Form

- [ ] The comments textarea isn't populating. For textarea you don't use `value`, instead you put the info between the element tags.

```html
<textarea rows="4" cols ="50" name="comments" id="comments"><%=@book.comments%></textarea>
```

## Log Out

- You have this text really big on the log out screen "Due to confidentiality and copyright laws we must verify your Age and Name." Not sure if you want it. Lol!