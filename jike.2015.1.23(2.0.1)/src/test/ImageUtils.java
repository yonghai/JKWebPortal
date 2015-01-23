package test;
import java.awt.Color;
import java.awt.Graphics;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.awt.image.ConvolveOp;
import java.awt.image.Kernel;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.swing.ImageIcon;

import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGEncodeParam;
import com.sun.image.codec.jpeg.JPEGImageEncoder;


public class ImageUtils {  
  
    public static void resize(File originalFile, File resizedFile,  
            int newWidth, int newHeight, float quality) throws IOException {  
        if (quality > 1) {  
            throw new IllegalArgumentException(  
                    "Quality has to be between 0 and 1");  
        }  
        ImageIcon ii = new ImageIcon(originalFile.getCanonicalPath());  
        Image i = ii.getImage();  
        Image resizedImage = null;  
     /*   int iWidth = i.getWidth(null);  
        int iHeight = i.getHeight(null);  
        if (iWidth > iHeight) {  
            resizedImage = i.getScaledInstance(newWidth, (newWidth * iHeight)  
                    / iWidth, Image.SCALE_SMOOTH);  
        } else {  
            resizedImage = i.getScaledInstance((newWidth * iWidth) / iHeight,  
                    newWidth, Image.SCALE_SMOOTH);  
        }  */
        resizedImage = i.getScaledInstance(newWidth, newHeight, Image.SCALE_SMOOTH);
        // This code ensures that all the pixels in the image are loaded.  
        Image temp = new ImageIcon(resizedImage).getImage();  
        // Create the buffered image.  
        BufferedImage bufferedImage = new BufferedImage(temp.getWidth(null),  
                temp.getHeight(null), BufferedImage.TYPE_INT_RGB);  
  
        // Copy image to buffered image.  
        Graphics g = bufferedImage.createGraphics();  
  
        // Clear background and paint the image.  
        g.setColor(Color.white);  
        g.fillRect(0, 0, temp.getWidth(null), temp.getHeight(null));  
        g.drawImage(temp, 0, 0, null);  
        g.dispose();  
  
        // Soften.  
        float softenFactor = 0.05f;  
        float[] softenArray = { 0, softenFactor, 0, softenFactor,  
                1 - (softenFactor * 4), softenFactor, 0, softenFactor, 0 };  
        Kernel kernel = new Kernel(3, 3, softenArray);  
        ConvolveOp cOp = new ConvolveOp(kernel, ConvolveOp.EDGE_NO_OP, null);  
        bufferedImage = cOp.filter(bufferedImage, null);  
  
        // Write the jpeg to a file.  
        FileOutputStream out = new FileOutputStream(resizedFile);  
  
        // Encodes image as a JPEG data stream  
        JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(out);  
  
        JPEGEncodeParam param = encoder  
                .getDefaultJPEGEncodeParam(bufferedImage);  
  
        param.setQuality(quality, true);  
  
        encoder.setJPEGEncodeParam(param);  
        encoder.encode(bufferedImage);  
    } // Example usage  
  
    public static void main(String[] args) throws IOException {  
         File files = new File("C:\\Users\\jike\\Desktop\\jike\\p\\添加两个商品\\1");  
     //    resize(files, new File("C:/Users/yh/Desktop/新建文件夹 (3)/160/1000588_300.png"), 300, 300, 0.7f);
      //   resize(files, new File("C:/Users/yh/Desktop/新建文件夹 (3)/160/1000588_160.png"), 160, 160, 0.7f);
        /* File file1 = new File("C:/Users/yh/Desktop/jike/jike/商品图片/新建文件夹/1000730.jpg");  
         resize(file1, new File("C:/Users/yh/Desktop/jike/jike/商品图片/新建文件夹/160/1000730_300.jpg"), 300, 300, 0.7f);
         resize(file1, new File("C:/Users/yh/Desktop/jike/jike/商品图片/新建文件夹/160/1000730_160.jpg"), 160, 160, 0.7f);
         File file2 = new File("C:/Users/yh/Desktop/jike/jike/商品图片/新建文件夹/1000731.jpg");  
         resize(file2, new File("C:/Users/yh/Desktop/jike/jike/商品图片/新建文件夹/160/1000731_300.jpg"), 300, 300, 0.7f);
         resize(file2, new File("C:/Users/yh/Desktop/jike/jike/商品图片/新建文件夹/160/1000731_160.jpg"), 160, 160, 0.7f);
      */
         //686
         File[] originalImages = files.listFiles();
         for(int i=0;i<originalImages.length;i++){
        	 String name = originalImages[i].getName();
        	 String parentpath = originalImages[i].getParent()+"";
        	 System.out.println(parentpath);
        	 String name300 = name.substring(0,name.lastIndexOf("."))+"_300"+name.substring(name.lastIndexOf("."));
        	 resize(originalImages[i], new File(parentpath+"/"+name300), 300, 300, 0.7f);
        	 String name160 = name.substring(0,name.lastIndexOf("."))+"_160"+name.substring(name.lastIndexOf("."));
        	 resize(originalImages[i], new File(parentpath+"/"+name160), 160, 160, 0.7f);
         }
    }
}  
