package klu.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.util.Base64;
import java.util.Random;

@RestController
public class CaptchaController {

    @GetMapping("/captcha")
    public String getCaptcha() {
        // Generate random text for CAPTCHA
        String captchaText = generateRandomText();
        
        // Create image with the text
        BufferedImage captchaImage = new BufferedImage(160, 50, BufferedImage.TYPE_INT_RGB);
        Graphics2D g2d = captchaImage.createGraphics();
        
        // Set background color to gray
        g2d.setColor(Color.GRAY);
        g2d.fillRect(0, 0, 160, 50);
        
        // Draw each character in black
        Random rand = new Random();
        int xPosition = 20;

        for (char c : captchaText.toCharArray()) {
            // Set color for the text to black
            g2d.setColor(Color.BLACK);
            g2d.setFont(new Font("Arial", Font.BOLD, 40));

            // Slightly rotate each character for effect
            double rotation = (rand.nextInt(21) - 10) * Math.PI / 180;  // Rotation between -10 and +10 degrees
            g2d.rotate(rotation, xPosition, 40);
            g2d.drawString(String.valueOf(c), xPosition, 40);
            g2d.rotate(-rotation, xPosition, 40);  // Reset rotation
            
            xPosition += 30;  // Increase x-position for next character
        }

        // Draw a single arc as noise
        drawArc(g2d, captchaImage.getWidth(), captchaImage.getHeight());

        g2d.dispose();

        // Convert image to Base64
        try (ByteArrayOutputStream outputStream = new ByteArrayOutputStream()) {
            ImageIO.write(captchaImage, "png", outputStream);
            byte[] imageBytes = outputStream.toByteArray();
            String base64Captcha = Base64.getEncoder().encodeToString(imageBytes);
            
            // Return CAPTCHA image and text as JSON
            return "{\"captcha\":\"" + base64Captcha + "\", \"captchaText\":\"" + captchaText + "\"}";
        } catch (Exception e) {
            return "{\"error\":\"Captcha generation failed\"}";
        }
    }

    // Method to generate random text for CAPTCHA
    private String generateRandomText() {
        String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
        StringBuilder captchaText = new StringBuilder(5);
        Random rnd = new Random();
        while (captchaText.length() < 5) {
            int index = (int) (rnd.nextFloat() * chars.length());
            captchaText.append(chars.charAt(index));
        }
        return captchaText.toString();
    }

    // Method to draw a single arc on the CAPTCHA image
    private void drawArc(Graphics2D g2d, int width, int height) {
        g2d.setColor(Color.LIGHT_GRAY); // Set color for the arc
        g2d.setStroke(new BasicStroke(2)); // Set stroke size for the arc

        // Draw a single arc
        int arcStartX = 10;
        int arcStartY = 15;
        int arcWidth = width - 20;
        int arcHeight = height - 20;
        g2d.drawArc(arcStartX, arcStartY, arcWidth, arcHeight, 0, 180); // Draw a half-arc
    }
}
