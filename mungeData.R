library("dplyr")
library("ggplot2")

#Load timezones
timezones_df = read.table("data/airport_timezones.csv", sep = ",", 
                          header = TRUE, colClasses = c("character", "character"), stringsAsFactors = FALSE)

#Load data
data = read.table("data/ryanair_checkin_data.csv", header = TRUE, sep = ",", stringsAsFactors = FALSE) %>%
  dplyr::mutate(checkin_datetime =  paste(checkin_date, checkin_time)) %>%
  dplyr::mutate(departure_datetime = paste(departure_date, departure_time)) %>%
  dplyr::left_join(timezones_df, by = "from") %>%
  dplyr::tbl_df()

#Caclulate difference in days
checkin = strptime(data$checkin_datetime, "%d/%m/%Y %H:%M", tz = "GMT")
departure = strptime(paste(data$departure_datetime, data$timezone), "%d/%m/%Y %H:%M:%S %z", tz = "GMT")
data = dplyr::mutate(data, days_before_departure = as.numeric(departure-checkin))

#Extract row letters and numbers
data_seat_classes = dplyr::mutate(data, seat_letter = stringr::str_extract(data$seat_number, '\\D')) %>%
  dplyr::mutate(seat_row = as.numeric(stringr::str_extract(data$seat_number, '\\d+'))) %>%
  dplyr::mutate(seat_is_middle = ifelse(seat_letter == "B" | seat_letter == "E", TRUE, FALSE)) %>%
  dplyr::mutate(checkin_first_day = ifelse(days_before_departure >= 6, TRUE, FALSE)) %>%
  dplyr::mutate(checkin_text = ifelse(checkin_first_day, "Within 24 hours", "After 24 hours"))

#Calculate the frequency of getting middle seats
freq_table = dplyr::group_by(data_seat_classes, checkin_text) %>% 
  summarise(middle_seat_count = length(which(seat_is_middle)), total_count = length(seat_is_middle)) %>%
  dplyr::select(checkin_text, total_count, middle_seat_count) %>%
  dplyr::mutate(frequency = middle_seat_count/total_count) %>%
  as.data.frame()
colnames(freq_table) = c("Check-in time", "Number of flights", "Middle seats", "Fraction")
freq_table

#Look at the histogram of row numbers
ggplot(data_seat_classes, aes(x = as.factor(seat_row))) + geom_histogram() + 
  facet_wrap(~checkin_text) + 
  xlab("Seat row number") + 
  ylab("Number of flights")


  



                       
