library(rvest)
library(gha)
library(tidyverse)
library(httr2)

pdflink_last <- readRDS("pdflink_last.rds")

# Scrape the website
url <- "https://shrl.hkust.edu.hk/apply-for-housing/pg/continuing-rpgs"
pdflink <- read_html(url) %>% 
  html_elements(xpath = "//a[strong[text()='Continuing RPGs Waitlist']]") %>% 
  html_attr('href') %>% 
  url_absolute(base = url)

if (length(pdflink) == 0){
  stop("No link found! Did the website or the selector change?")
}

gha_notice("The waiting list was last updated at {ymd(str_extract(pdflink, '\\d{8}'))}")

if(pdflink != pdflink_last){
  gha_notice("Waiting list updated. Sending notification.")
  msg <- paste0("Please visit ", pdflink)
  request("https://ntfy.sh/") %>% 
    req_url_path('ust_pg_housing_wl') %>% 
    req_body_raw(msg) %>% 
    req_headers(Title = 'PG Housing Waiting List Updated', Click = pdflink) %>% 
    req_perform()
}

pdflink %>% saveRDS("pdflink_last.rds")




