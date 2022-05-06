
import java.io.File;
import java.sql.Timestamp;

import Model.Note;
import net.sourceforge.tess4j. Tesseract;
import net.sourceforge.tess4j.TesseractException;
                                                 
public class ReadImage{
   public static void main(String[] args){
	   Timestamp timestamp = new Timestamp(System.currentTimeMillis());
	   Note n = new Note("abcde", timestamp);
	   System.out.println(n.getTimeDate());
    }
}