from django.urls import path
from . import views


app_name = 'movies'

urlpatterns = [
    path('movie/<int:movie_id>/', views.movie_detail, name='movie_detail'),
]