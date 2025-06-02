## Task 5:

The Developers team also wants you to ensure that emails are converted to lowercase after an update operation. Currently, new insertions are guaranteed to have lowercase emails, but there is no such guarantee for legacy emails. Therefore, the team wants to ensure that emails are being retained in a lowercase irrespective of any changes in the database. Create a new `TRIGGER` called **email_update** for the `USERS` table that runs before an `UPDATE` operation.
