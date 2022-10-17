class App
    def options
        [
            '[1] => List all books'
            '[2] => List all music albums'
            '[3] => List all movies'
            '[4] => List all games'
            '[5] => List all genres'
            '[6] => List all labels'
            '[7] => List all authors'
            '[8] => List all sources'
            '[9] => Add a book'
            '[10] => Add a music album'
            '[11] => Add a movie'
            '[12] => Add a game'
        ]
    end
    
    def check_selection(response)
        case response
        when '1'
            list_all_books
        when '2'
            list_all_music_albums
        when '3'
            lits_all_movies
        when '4'
            list_all_games
        when '5'
            list_all_genres
        when '6'
            list_all_labels
        when '7'
            list_all_authors
        when '8'
            list_all_sources
        when '9'
            create_book
        when '10'
            create_music_album
        when '11'
            create_movie
        when '12'
            create_game            
        end
    end 
end