  boolean saveToUrl_JPG(String filename, PImage ourImg) {
    ImageToWeb img = new ImageToWeb(this);
    img.setType(ImageToWeb.JPEG);
    img.save(filename,false); // this line saves the file locally
//   byte[] bufIm = bufferImage(ourImg);
//PGraphics temporary = new PGraphics();
//println("width "+ourImg.width+" height "+ourImg.height);
//temporary.copy(ourImg,0,0,1200,720, 0,0,1200,720);
    img.post("images",USER_URL,filename,false);
    return true;
  }

/*

public void post(java.lang.String project,
                 java.lang.String url,
                 java.lang.String filename,
                 boolean popup,
                 byte[] bytes)

    Special Image Post function, automatically adds the right extension Takes a byte array, from other images

    Parameters:
        project - the project folder
        url - url to the file that receives the data
        filename - the filename it's supposed to save as
        popup - wether or not to open the link with the file
        bytes - the byte array to post



*/
