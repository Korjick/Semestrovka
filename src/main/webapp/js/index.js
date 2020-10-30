document.addEventListener('DOMContentLoaded', function() {
    let password = document.getElementById("inputPasswordSignUp"),
        confirm_password = document.getElementById("inputPasswordRepeatSignUp"),
        search = document.getElementById('filmRecommendationFilterSearch');

    function checkPassword(){
        let check = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,20}$/;
        if(!password.value.match(check)) {
            password.setCustomValidity("Wrong format of password. " +
                "Пароль должен состоять от 6 ддо 20 латинских символов, содержать хотя бы одну цифру и одну заглавную букву.");
        } else {
            password.setCustomValidity('');
        }
    }

    function validatePassword(){
        if(password.value !== confirm_password.value) {
            confirm_password.setCustomValidity("Пароли не совпадают");
        } else {
            confirm_password.setCustomValidity('');
        }
    }

    async function getRecommendationList(){
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

        let url = window.location.href + '/filmRecommendation';
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

        let result = await response.json();
        generateFilms(result);
    }

    function generateFilms(result){
        let filmRecommendationResult = document.getElementById('filmRecommendationResult');
        let html = "";

        for (let i = 0; i < result.length; i++) {
            html += '<img src="' + result[i].posterUrl + '" class="rounded mx-3 my-3" alt="' + result[i].filmId + '">\n';
        }
        filmRecommendationResult.innerHTML = html;
    }

    password.onkeyup = checkPassword;
    password.onchange = validatePassword;
    confirm_password.onkeyup = validatePassword;
    search.onclick = function() {
        console.log('clicked');
        getRecommendationList();
    }

    getRecommendationList();
}, false);