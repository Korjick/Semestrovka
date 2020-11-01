document.addEventListener('DOMContentLoaded', function () {

    let watchedFilms = document.getElementById('watchedFilms'),
        likedFilms = document.getElementById('likedFilms'),
        clearLikedFilms = document.getElementById('clearLikedFilms'),
        clearWatchedFilms = document.getElementById('clearWatchedFilms'),
        changePassword = document.getElementById('changePassword'),
        clearUser = document.getElementById('clearUser');

    async function getData(){
        let url = window.location.href;

        try {
            let response = await fetch(url, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json;charset=utf-8',
                }
            });

            let result = await response.text();
            await generateWatchedFilms(result);
            await generateLikedFilms(result);
        } catch (e) {
            alert(e);
        }
    }

    function generateWatchedFilms(result){
        let watchedFilmsTmp = JSON.parse(result.split("@")[0]);

        let html = '<ul class="list-group list-group-flush overflow-y">\n<h4>Просмотренные фильмы:</h4>\n';

        for (let i = 0; i < watchedFilmsTmp.length; i++) {
            html += '<li class="list-group-item row d-flex" data-toggle="modal" data-target="#filmModal"><img class="mr-1 rounded" src="' + watchedFilmsTmp[i].posterUrl + '" alt="' + watchedFilmsTmp[i].filmId + '" style="width: 90px; height: 100px;"><p>' + watchedFilmsTmp[i].nameRu + ' (' + watchedFilmsTmp[i].nameEn + ')</p></li>\n';
        }

        html += '</ul>';
        watchedFilms.innerHTML = html;

        let resultImages = watchedFilms.getElementsByTagName('img');
        for (let i = 0; i < resultImages.length; i++) {
            resultImages[i].addEventListener('click', getFilmById, false);
        }
    }

    function generateLikedFilms(result){
        let likedFilmsTmp = JSON.parse(result.split("@")[1]);

        let html = '<ul class="list-group list-group-flush overflow-y">\n<h4>Понравившиеся фильмы:</h4>\n';

        for (let i = 0; i < likedFilmsTmp.length; i++) {
            html += '<li class="list-group-item row d-flex" data-toggle="modal" data-target="#filmModal"><img class="mr-1 rounded" src="' + likedFilmsTmp[i].posterUrl + '" alt="' + likedFilmsTmp[i].filmId + '" style="width: 90px; height: 100px;"><p>' + likedFilmsTmp[i].nameRu + '(' + likedFilmsTmp[i].nameEn + ')</p></li>\n';
        }

        html += '</ul>';
        likedFilms.innerHTML = html;

        let resultImages = likedFilms.getElementsByTagName('img');
        for (let i = 0; i < resultImages.length; i++) {
            resultImages[i].addEventListener('click', getFilmById, false);
        }
    }

    async function getFilmById() {
        let id = this.alt;
        let url = window.location.href.split("?")[0].substring(0, window.location.href.lastIndexOf('/')) + '/film';
        try {
            let response = await fetch(url, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json;charset=utf-8',
                    'id': id
                }
            });

            let result = await response.json();
            await generateFilmById(result);
        } catch (e) {
            alert(e);
        }
    }

    function generateFilmById(result) {
        let filmModal = document.getElementById('filmModal');
        filmModal.innerHTML = '<div class="modal-dialog">\n' +
            '        <div class="modal-content">\n' +
            '            <div class="modal-header">\n' +
            '                <div>\n' +
            '                    <h3 class="modal-title" id="#filmModal">' + result.nameRu + '</h3>\n' +
            '                    <h4>' + result.nameEn + '</h4>\n' +
            '                </div>\n' +
            '                <button class="btn-close" data-dismiss="modal" aria-label="close"></button>\n' +
            '            </div>\n' +
            '            <div class="modal-body row">\n' +
            '                <div class="col-5">\n' +
            '                    <img src="' + result.posterUrl + '" alt="" style="width: 175px; height: 250px;">\n' +
            '                </div>\n' +
            '                <div class="col-7">\n' +
            '                    <h5>О фильме</h5>\n' +
            '                    <ul class="list-group list-group-flush">\n' +
            '                        <li class="list-group-item">Год производства: ' + result.year + '</li>\n' +
            '                        <li class="list-group-item">Страна производства: ' + JSONArrayToString(result.countries, 'country') + '</li>\n' +
            '                        <li class="list-group-item">Жанр: ' + JSONArrayToString(result.genres, 'genre') + '</li>\n' +
            '                    </ul>\n' +
            '                </div>\n' +
            '            </div>\n' +
            '        </div>\n' +
            '    </div>'
    }

    async function clearWatchedFilmsClick(){
        let url = window.location.href.split("?")[0].substring(0, window.location.href.lastIndexOf('/')) + '/clear';
        try {
            await fetch(url, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json;charset=utf-8',
                    'clear': 1
                }
            });
            location.reload();
        } catch (e) {
            alert(e);
        }
    }

    async function clearLikedFilmsClick(){
        let url = window.location.href.split("?")[0].substring(0, window.location.href.lastIndexOf('/')) + '/clear';
        try {
            await fetch(url, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json;charset=utf-8',
                    'clear': 2
                }
            });
            location.reload();
        } catch (e) {
            alert(e);
        }
    }

    async function clearUserClick(){
        let url = window.location.href.split("?")[0].substring(0, window.location.href.lastIndexOf('/')) + '/clear';
        try {
            await fetch(url, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json;charset=utf-8',
                    'clear': 0
                }
            });
            location.reload();
        } catch (e) {
            alert(e);
        }
    }

    function JSONArrayToString(array, name){

        let res = '';

        for (let i = 0; i < array.length - 1; i++) {
            res += array[i][name] + ', ';
        }
        res += array[array.length - 1][name];

        return decodeURIComponent(res);
    }

    getData();
    clearWatchedFilms.addEventListener('click', clearWatchedFilmsClick, false);
    clearLikedFilms.addEventListener('click', clearLikedFilmsClick, false);
    clearUser.addEventListener('click', clearUserClick, false);
}, false);