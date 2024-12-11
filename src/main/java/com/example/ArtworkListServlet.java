package com.example;

import com.example.artgallery.model.Artwork;
import com.example.artgallery.dao.ArtworkDAO;
import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * Servlet implementation class ArtworkListServlet
 */
@WebServlet("/getArtworks")
public class ArtworkListServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public ArtworkListServlet() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Artwork> artworks = new ArtworkDAO().getAllArtworks();

        response.setContentType("application/json");
        response.getWriter().write(new Gson().toJson(artworks)); // Convert the list to JSON using Gson
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
