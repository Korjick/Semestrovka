document.addEventListener('DOMContentLoaded', function () {

    let watchedFilms = document.getElementById('watchedFilms'),
        likedFilms = document.getElementById('likedFilms'),
        clearLikedFilms = document.getElementById('clearLikedFilms'),
        clearWatchedFilms = document.getElementById('clearWatchedFilms'),
        clearUser = document.getElementById('clearUser'),
        password = document.getElementById("inputPassword"),
        confirm_password = document.getElementById("inputPasswordRepeat"),
        change_password = document.getElementById('changePassword');

    function checkPassword() {
        let check = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,20}$/;
        if (!password.value.match(check)) {
            return false;
        } else {
            return true;
        }
    }

    function validatePassword() {
        if (password.value !== confirm_password.value) {
            return false;
        } else {
            return true;
        }
    }

    async function getData(){
        let url = window.location.pathname;

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
            console.log(e);
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
        let url = window.location.pathname.substring(0, window.location.pathname.lastIndexOf('/')) + '/film';

        try {
            let response = await fetch(url, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json;charset=utf-8',
                    'id': id
                }
            });

            let result = await response.text();
            await generateFilmById(JSON.parse(result.split("@")[0]), JSON.parse(result.split("@")[1]), JSON.parse(result.split("@")[2]));
        } catch (e) {
            console.log(e)
        }
    }

    function generateFilmById(result, watched, liked) {
        let filmModal = document.getElementById('filmModal');

        let add;
        if (Object.keys(watched).length !== 0) {
            add =
                '            <div class="modal-footer d-flex justify-content-between align-items-center">\n' +
                '                   <img id="watched" src="' + window.location.pathname.substring(0, window.location.pathname.lastIndexOf('/')) + '/img/watched' + watched.watched + '.png" alt="" style="width: 50px;height: 50px;">\n' +
                '                   <img id="liked" src="' + window.location.pathname.substring(0, window.location.pathname.lastIndexOf('/')) + '/img/liked' + liked.liked + '.png" alt="" style="width: 50px;height: 50px;">\n' +
                '        </div>\n' +
                '    </div>';
        } else {
            add =
                '            <div class="modal-footer d-flex justify-content-between align-items-center">\n' +
                '        </div>\n' +
                '    </div>';
        }

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
            '                    <img src="' + result.posterUrl + '" alt="" style="height: 250px; width: 175px;">\n' +
            '                </div>\n' +
            '                <div class="col-7">\n' +
            '                    <h5>О фильме</h5>\n' +
            '                    <ul class="list-group list-group-flush">\n' +
            '                        <li class="list-group-item">Год производства: ' + result.year + '</li>\n' +
            '                        <li class="list-group-item">Страна производства: ' + JSONArrayToString(result.countries, 'country') + '</li>\n' +
            '                        <li class="list-group-item">Жанр: ' + JSONArrayToString(result.genres, 'genre') + '</li>\n' +
            '                    </ul>\n' +
            '                </div>\n'
            + add;

        let watchedTmp = document.getElementById('watched');
        let likedTmp = document.getElementById('liked');

        let filmid = result.filmId;

        if (watchedTmp != null) {
            watchedTmp.addEventListener('click', async function () {
                let url = window.location.pathname.substring(0, window.location.pathname.lastIndexOf('/')) + '/edit';
                let watchedTmp = document.getElementById('watched');

                try {
                    let response = await fetch(url, {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/json;charset=utf-8',
                            'edit': 1,
                            'id': filmid
                        }
                    });

                    let result = await response.json();
                    console.log(result);
                    watchedTmp.src = window.location.pathname.substring(0, window.location.pathname.lastIndexOf('/')) + "/img/watched" + result.res[0] + ".png";
                } catch (e) {
                    console.log(e)
                }
            }, false);
        }

        if (likedTmp != null) {
            likedTmp.addEventListener('click', async function () {
                let url = window.location.pathname.substring(0, window.location.pathname.lastIndexOf('/')) + '/edit';
                let likedTmp = document.getElementById('liked');

                try {
                    let response = await fetch(url, {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/json;charset=utf-8',
                            'edit': 2,
                            'id': filmid
                        }
                    });

                    let result = await response.json();
                    likedTmp.src = window.location.pathname.substring(0, window.location.pathname.lastIndexOf('/')) + "/img/liked" + result.res[0] + ".png";
                } catch (e) {
                    console.log(e)
                }
            }, false);
        }
    }

    async function clearWatchedFilmsClick(){
        let url = window.location.pathname.substring(0, window.location.pathname.lastIndexOf('/')) + '/clear';
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
            console.log(e);
        }
    }

    async function clearLikedFilmsClick(){
        let url = window.location.pathname.substring(0, window.location.pathname.lastIndexOf('/')) + '/clear';
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
            console.log(e);
        }
    }

    async function clearUserClick(){
        let url = window.location.pathname.substring(0, window.location.pathname.lastIndexOf('/')) + '/clear';
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
            console.log(e);
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

    async function changePassword(){
        let url = window.location.pathname.substring(0, window.location.pathname.lastIndexOf('/')) + '/edit';
        if(checkPassword()) {
            if(validatePassword()) {
                try {
                    console.log(password.value + "@");
                    await fetch(url, {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/json;charset=utf-8',
                            'edit': 0,
                            'password': password.value
                        }
                    });
                    location.reload();
                } catch (e) {
                    console.log(e);
                }
            } else {
                alert("Пароли не совпадают");
            }
        } else {
            alert("Неправильный формат пароля. " +
                "Пароль должен состоять от 6 ддо 20 латинских символов, содержать хотя бы одну цифру и одну заглавную букву.");
        }
    }

    getData();
    clearWatchedFilms.addEventListener('click', clearWatchedFilmsClick, false);
    clearLikedFilms.addEventListener('click', clearLikedFilmsClick, false);
    clearUser.addEventListener('click', clearUserClick, false);

    change_password.addEventListener('click', changePassword, false);
}, false);