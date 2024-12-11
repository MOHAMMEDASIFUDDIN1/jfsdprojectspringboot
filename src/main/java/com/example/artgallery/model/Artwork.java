package com.example.artgallery.model;

public class Artwork {
    private String title;
    private double price;
    private String imagePath;

    // Constructor
    public Artwork(String title, double price, String imagePath) {
        this.title = title;
        this.price = price;
        this.imagePath = imagePath;
    }

    // Getters and setters (if needed)
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }
}
