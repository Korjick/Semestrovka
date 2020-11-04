package ru.itlab.servlets;

import org.json.JSONArray;
import org.json.JSONObject;
import ru.itlab.dto.SignUpForm;
import ru.itlab.services.SignInService;
import ru.itlab.services.SignUpService;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.Reader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.nio.charset.StandardCharsets;
import java.sql.Date;

@WebServlet("/vkreg")
public class VKRegServlet extends HttpServlet {

    private SignUpService signUpService;
    private String BASE_CONTEXT;

    @Override
    public void init(ServletConfig config) {
        signUpService = (SignUpService) config.getServletContext().getAttribute("signUpService");
        BASE_CONTEXT = (String) config.getServletContext().getAttribute("baseContext");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Long client_id = 7650762L;

        if (request.getParameter("code") == null) {
            response.sendRedirect("https://oauth.vk.com/authorize?client_id=" + client_id + "&display=page&redirect_uri=http://localhost:8080/inf-1-sem/vkreg&scope=email&response_type=code&v=5.124");
        } else {
            String code = request.getParameter("code");
            String stringUrl = "https://oauth.vk.com/access_token?client_id=" + client_id + "&client_secret=xHgdj6q8cHogZz7hqVhQ&redirect_uri=http://localhost:8080/inf-1-sem/vkreg&code=" + code;

            InputStreamReader inputStreamReader = null;
            BufferedReader reader = null;
            HttpURLConnection uc = null;

            try {
                String access_token;
                Long user_id;
                String email;

                URL url = new URL(stringUrl);
                uc = (HttpURLConnection) url.openConnection();
                uc.setRequestMethod("GET");

                inputStreamReader = new InputStreamReader(uc.getInputStream(), StandardCharsets.UTF_8);
                reader = new BufferedReader(inputStreamReader);

                String jsonText = readAll(reader);
                JSONObject json = new JSONObject(jsonText);
                access_token = json.getString("access_token");

                if (access_token != null) {
                    user_id = json.getLong("user_id");
                    email = json.getString("email");

                    url = new URL("https://api.vk.com/method/users.get?user_ids=" + user_id + "&fields=bdate&access_token=" + access_token + "&v=5.124");
                    uc = (HttpURLConnection) url.openConnection();
                    uc.setRequestMethod("GET");

                    inputStreamReader = new InputStreamReader(uc.getInputStream(), StandardCharsets.UTF_8);
                    reader = new BufferedReader(inputStreamReader);
                    jsonText = readAll(reader);
                    json = new JSONObject(jsonText);

                    JSONArray arr = json.getJSONArray("response");
                    JSONObject info = arr.getJSONObject(0);

                    String name = info.getString("first_name");
                    String bdate = info.getString("bdate");
                    String birthDate = bdate.split("\\.")[2] + "-"
                            + bdate.split("\\.")[1] + "-"
                            + bdate.split("\\.")[0];

                    SignUpForm form = new SignUpForm();
                    form.setUsername(name);
                    form.setEmail(email);
                    form.setDateOfBirth(birthDate);
                    form.setPassword(user_id + email);

                    Long id = signUpService.signUp(form);
                    if (id > 0) {
                        HttpSession session = request.getSession();
                        session.setAttribute("id", id);
                        session.setAttribute("oauth", 1);
                        response.sendRedirect(BASE_CONTEXT + "/profile");
                    } else {
                        response.sendRedirect(BASE_CONTEXT + "?error=" + id);
                    }
                } else {
                    response.sendRedirect(BASE_CONTEXT + "?error=-4");
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                if (reader != null) {
                    reader.close();
                }
                if (inputStreamReader != null) {
                    inputStreamReader.close();
                }
                if (uc != null) {
                    uc.disconnect();
                }
            }
        }
    }

    private static String readAll(Reader rd) throws IOException {
        StringBuilder sb = new StringBuilder();
        int cp;
        while ((cp = rd.read()) != -1) {
            sb.append((char) cp);
        }
        return sb.toString();
    }
}
