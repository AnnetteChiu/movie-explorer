library(ggvis)

# For dropdown menu
actionLink <- function(inputId, ...) {
  tags$a(href='javascript:void',
         id=inputId,
         class='action-button',
         ...)
}

fluidPage(
  
  
  tags$head(
    tags$style(HTML("
                    @import url('//fonts.googleapis.com/css?family=Lobster|Cabin:400,700');
                    
                    h1 {
                    font-family: 'Lobster';
                    font-weight: 500;
                    line-height: 1.1;
                    color: #48ca3b;
                    }
                    h2{
                    font-family: 'Lobster';
                    font-weight: 100;
                    line-height: 1;
                    color: #48ca3b;
                    
                    }
                    
                    "))
    ),
  
  
  titlePanel(h1("Annette's Movie explorer")),
  fluidRow(
    column(3,
           wellPanel(
             
             
             selectInput("language", "language",
                         c("All", "English", "Vietnamese", "Turkish", "Italian", "Kurdish",
                           "German", "Japanese", "Thai", "Mandarin", " Indian Sign Language",                                    "Spanish",
                           "Latin", "French", "Swedish", "Korean")),
             
             selectInput("genre", "Genre (a movie can have multiple genres)",
                         c("All", "Action", "Adventure", "Animation", "Biography", "Comedy",
                           "Crime", "Documentary", "Drama", "Family", "Fantasy", "History",
                           "Horror", "Music", "Musical", "Mystery", "Romance", "Sci-Fi",
                           "Short", "Sport", "Thriller", "War", "Western")),
             sliderInput("reviews", "Minimum number of reviews on Rotten Tomatoes",
                         10, 300, 80, step = 10),
             sliderInput("year", "Year released", 1940, 2014, value = c(1970, 2014)),
             sliderInput("oscars", "Minimum number of Oscar wins (all categories)",
                         0, 4, 0, step = 1),
             sliderInput("boxoffice", "Dollars at Box Office (millions)",
                         0, 800, c(0, 800), step = 1)
                         
             
             
           ),
           wellPanel(
             selectInput("xvar", "X-axis variable", axis_vars, selected = "Meter"),
             selectInput("yvar", "Y-axis variable", axis_vars, selected = "Reviews"),
             tags$small(paste0(
               "",
               " (as judged by the Rotten Tomatoes staff), and the Numeric rating is",
               " a normalized 1-10 score of those reviews which have star ratings",
               " ."
             ))
           )
    ),
    column(9,
           ggvisOutput("plot1"),
           wellPanel(
             span("Number of movies selected:",
                  textOutput("n_movies")
             )
           )
    )
  )
    )
