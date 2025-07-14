from django.contrib import admin
from .models import Genre, GenreFilmWork
from .models import FilmWork
from .models import Person, PersonFilmWork

class GenreFilmWorkInline(admin.TabularInline):
    model = GenreFilmWork


@admin.register(FilmWork)
class FilmWorkAdmin(admin.ModelAdmin):
    inlines = (GenreFilmWorkInline,)

    # Отображение полей в списке
    list_display = ('title', 'type', 'creation_date', 'rating',)

    # Фильтрация в списке
    list_filter = ('type',)

    # Поиск по полям
    search_fields = ('title', 'description', 'id')


@admin.register(Genre)
class GenreAdmin(admin.ModelAdmin):
    pass


@admin.register(Person)
class PersonAdmin(admin.ModelAdmin):
    pass

@admin.register(PersonFilmWork)
class PersonFilmWorkAdmin(admin.ModelAdmin):
    pass