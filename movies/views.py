from django.shortcuts import render

# Create your views here.
def movie_detail(request, movie_id):
    # Здесь должна быть логика получения данных о фильме по movie_id
    # Например, можно использовать ORM Django для получения объекта фильма из базы данных
    movie = {
        'id': movie_id,
        'title': 'Пример фильма',
        'description': 'Описание фильма',
        'release_date': '2023-01-01',
        'rating': 8.5,
    }

    return render(request, 'movies/movie_detail.html', {'movie': movie})