_The Github Action version of [dont_panic](https://github.com/JiaZhang42/dont_panic)._

# DONT_PANIC_GHA

Have you ever checked the waiting list 20 times a day to see if you can get a spot? Sometimes such behavior becomes obsessive and compulsive. 

The goal of `dont_panic_gha` is to help you to avoid this behavior. The program will check the website for you during the time interval and with the frequency you want. If it finds an update to the waiting list, it will push a ntfy message (topic: ust_pg_housing_wl) to notify you.

Currently, the program is only used to check the HKSUT RPg housing application waiting list, but feel free to modify it to suit your needs.

----
[dont_panic](https://github.com/JiaZhang42/dont_panic) relies on the `blastula` package to send emails and `cron` to schedule the task, while [dont_panic_gha](https://github.com/JiaZhang42/dont_panic_gha) uses 
Github Action to schedule and push messages with `ntfy`. It doesn't need the complex setup required by `blastula`, and works even without your local computer opening and connecting to the network.
