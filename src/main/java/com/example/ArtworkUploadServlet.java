package com.example;

import com.example.artgallery.model.Artwork;
import com.example.artgallery.dao.ArtworkDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

/**
 * Servlet implementation class ArtworkUploadServlet
 */
@WebServlet("/uploadArtwork")
@MultipartConfig
public class ArtworkUploadServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public ArtworkUploadServlet() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get form parameters
        String artTitle = request.getParameter("artTitle");
        String artPrice = request.getParameter("artPrice");
        Part artImagePart = request.getPart("artImage");

        // Get the image file name
        String fileName = Paths.get(artImagePart.getSubmittedFileName()).getFileName().toString();
        String imagePath = "/images/artworks/" + fileName;

        // Save the image to the server (you'll need to create the directory)
        File uploads = new File(getServletContext().getRealPath("") + "/images/artworks");
        if (!uploads.exists()) {
            uploads.mkdirs();
        }

        try (InputStream inputStream = artImagePart.getInputStream()) {
            Files.copy(inputStream, new File(uploads, fileName).toPath(), StandardCopyOption.REPLACE_EXISTING);
        }

        // Store artwork details in the database (title, price, imagePath)
        Artwork artwork = new Artwork(artTitle, Double.parseDouble(artPrice), imagePath);
        ArtworkDAO artworkDAO = new ArtworkDAO();
        artworkDAO.storeArtwork(artwork);

        // Redirect to the shop page or show a success message
        response.sendRedirect("/shop.html");
    }
}
