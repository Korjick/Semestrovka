document.addEventListener('DOMContentLoaded', function () {
    let password = document.getElementById("inputPasswordSignUp"),
        confirm_password = document.getElementById("inputPasswordRepeatSignUp"),
        search = document.getElementById('filmRecommendationFilterSearch'),
        vkauthsignup = document.getElementById('vkauthsignup'),
        vkauthsignin = document.getElementById('vkauthsignin');

    function checkPassword() {
        let check = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,20}$/;
        if (!password.value.match(check)) {
            password.setCustomValidity("Неправильный формат пароля. " +
                "Пароль должен состоять от 6 ддо 20 латинских символов, содержать хотя бы одну цифру и одну заглавную букву.");
        } else {
            password.setCustomValidity('');
        }
    }

    function validatePassword() {
        if (password.value !== confirm_password.value) {
            confirm_password.setCustomValidity("Пароли не совпадают");
        } else {
            confirm_password.setCustomValidity('');
        }
    }

    async function getRecommendationList() {
        let filmRecommendationFilterCategory = document.getElementById('filmRecommendationFilterCategory');
        let filmRecommendationFilterCountry = document.getElementById('filmRecommendationFilterCountry');
        let filmRecommendationFilterYear = document.getElementById('filmRecommendationFilterYear');
        let filmRecommendationFilterRating = document.getElementById('filmRecommendationFilterRating');

        let CategoryCheckboxes = filmRecommendationFilterCategory.querySelectorAll('input[type=checkbox]:checked');
        let CountryCheckboxes = filmRecommendationFilterCountry.querySelectorAll('input[type=checkbox]:checked');
        let YearFields = filmRecommendationFilterYear.querySelectorAll('input[type=text]');
        let RatingFields = filmRecommendationFilterRating.querySelectorAll('input[type=text]');

        let CategoryArray = [];
        let CountryArray = [];
        let YearArray = [];
        let RatingArray = [];

        for (let i = 0; i < CategoryCheckboxes.length; i++) {
            CategoryArray.push(CategoryCheckboxes[i].value)
        }

        for (let i = 0; i < CountryCheckboxes.length; i++) {
            CountryArray.push(CountryCheckboxes[i].value)
        }

        for (let i = 0; i < YearFields.length; i++) {
            YearArray.push(YearFields[i].value);
        }

        for (let i = 0; i < RatingFields.length; i++) {
            RatingArray.push(RatingFields[i].value);
        }

        let url = window.location.protocol + 'filmRecommendation';

        try {
            let response = await fetch(url, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json;charset=utf-8',
                    'CategoryArray': CategoryArray,
                    'CountryArray': CountryArray,
                    'YearArray': YearArray,
                    'RatingArray': RatingArray
                }
            });

            let result = await response.text();
            await generateRecommendationList(JSON.parse(result.split("@")[0]));
            await generateRecommendationResultPersonal(JSON.parse(result.split("@")[1]))
        } catch (e) {
            console.log(e)
        }
    }

    function generateRecommendationList(result) {
        let html = "";
        let filmRecommendationResult = document.getElementById('filmRecommendationResult');

        for (let i = 0; i < result.length; i++) {
            html += '<img src="' + result[i].posterUrl + '" class="rounded mx-3 my-3" alt="' + result[i].filmId + '" data-toggle="modal" data-target="#filmModal">\n';
        }
        filmRecommendationResult.innerHTML = html;

        let resultImages = filmRecommendationResult.getElementsByTagName('img');
        for (let i = 0; i < resultImages.length; i++) {
            resultImages[i].addEventListener('click', getFilmById, false);
        }
    }

    function generateRecommendationResultPersonal(result) {
        let filmRecommendationResultPersonal = document.getElementById('filmRecommendationResultPersonal');
        let html = "";
        if (filmRecommendationResultPersonal != null) {
            for (let i = 0; i < result.length; i++) {
                html += '<img src="' + result[i].posterUrl + '" class="rounded mx-3 my-3" alt="' + result[i].filmId + '" data-toggle="modal" data-target="#filmModal">\n';
            }
            filmRecommendationResultPersonal.innerHTML = html;

            let resultImages = filmRecommendationResultPersonal.getElementsByTagName('img');
            for (let i = 0; i < resultImages.length; i++) {
                resultImages[i].addEventListener('click', getFilmById, false);
            }
        }
    }

    async function getFilmById() {
        let id = this.alt;
        let url = window.location.protocol + 'film';

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
                '                   <img id="watched" src="' + window.location.protocol + 'img/watched' + watched.watched + '.png" alt="" style="width: 50px;height: 50px;">\n' +
                '                   <img id="liked" src="' + window.location.protocol + 'img/liked' + liked.liked + '.png" alt="" style="width: 50px;height: 50px;">\n' +
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
            '                    <img src="' + result.posterUrl + '" alt="">\n' +
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
                let url = window.location.protocol + 'edit';
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
                    watchedTmp.src = window.location.protocol + "img/watched" + result.res[0] + ".png";
                } catch (e) {
                    console.log(e)
                }
            }, false);
        }

        if (likedTmp != null) {
            likedTmp.addEventListener('click', async function () {
                let url = window.location.protocol + 'edit';
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
                    likedTmp.src = window.location.protocol + "img/liked" + result.res[0] + ".png";
                } catch (e) {
                    console.log(e)
                }
            }, false);
        }
    }

    function JSONArrayToString(array, name) {

        let res = '';

        for (let i = 0; i < array.length - 1; i++) {
            res += array[i][name] + ', ';
        }
        res += array[array.length - 1][name];

        return decodeURIComponent(res);
    }

    function VKLog(){
        try {
           window.location.href = window.location.protocol + 'vkin';
        } catch (e) {
            console.log(e)
        }
    }

    function VKReg(){
        try {
            window.location.href = window.location.protocol + 'vkreg';
        } catch (e) {
            console.log(e)
        }
    }

    password.addEventListener('keyup', checkPassword, false);
    password.addEventListener('change', validatePassword, false);
    confirm_password.addEventListener('keyup', validatePassword, false);
    search.addEventListener('click', getRecommendationList, false);

    vkauthsignup.addEventListener('click', VKReg, false);
    vkauthsignin.addEventListener('click', VKLog, false);
    getRecommendationList();
}, false);