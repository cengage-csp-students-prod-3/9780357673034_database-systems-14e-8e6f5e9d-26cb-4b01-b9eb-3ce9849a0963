## Task 4:

The Development team of InstantStay wants to ensure that all email data of the users are lowercase. Otherwise, their login system could have problems finding the users. Therefore, they want you to ensure that each email in the table will always be lowercase after a new user is added. Create a `TRIGGER` called **email_insert** that will `SET` new email addresses to lowercase and run before new emails are added to the `USERS` table.
