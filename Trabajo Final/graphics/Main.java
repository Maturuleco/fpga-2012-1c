

import java.awt.image.BufferedImage;
import java.io.FileWriter;
import java.io.IOException;
import javax.imageio.ImageIO;
import javax.swing.JFileChooser;

/**
 * 
 * @author Natthawut
 */
public class Main {

	/** Creates a new instance of Main */
	public Main() {
	}

	public static String leadingZeros(int length, String str) throws Exception {
		if (str.length() > length)
			throw new Exception("Input string is longer than specified length.");
		else {
			int len = length - str.length();
			for (int i = 0; i < len; i++)
				str = "0" + str;
		}
		return str;
	}

	/**
	 * @param args
	 *            the command line arguments
	 */
	public static void main(String[] args) {
		// TODO code application logic here
		System.out.println("COE Image Generator - m3rlinez at gmail dot com");
		System.out.println("----------------------------------------");
		System.out.println("Generate COE file for 15bit x n ROM.");
		JFileChooser chooser = new JFileChooser();
		if (chooser.showOpenDialog(null) == JFileChooser.APPROVE_OPTION) {
			try {
				BufferedImage bimg = ImageIO.read(chooser.getSelectedFile());
				System.out.println("Image width: " + bimg.getWidth()
						+ " pixels");
				System.out.println("Image height: " + bimg.getHeight()
						+ " pixels");
				StringBuffer buffrgb = new StringBuffer();
				StringBuffer buffbw = new StringBuffer();
				buffrgb.append("memory_initialization_radix=16;\n");
				buffrgb.append("memory_initialization_vector= ");
				buffbw.append(buffrgb.toString());
				int pixel5 = 0, count5 = 0, addrcount5 = 0;
				int pixel15 = 0, count15 = 0, addrcount15 = 0;
				for (int i = 0; i < bimg.getHeight(); i++) {
					for (int j = 0; j < bimg.getWidth(); j++) {
						int color = bimg.getRGB(j, i);
						int r = (color >> 16) & 255;
						int g = (color >> 8) & 255;
						int b = (color) & 255;
						int bitstr = 0;
						if (r >= 128)
							bitstr += 4;
						if (g >= 128)
							bitstr += 2;
						if (b >= 128)
							bitstr += 1;
						int white = 0;
						if ((r + g + b) / 3 > 127)
							white = 1;
						pixel5 = (pixel5 << 3) + bitstr;
						count5++;
						pixel15 = (pixel15 << 1) + white;
						count15++;

						if (count5 == 5) {
							String hex;
							try {
								hex = leadingZeros(4, Integer
										.toHexString(pixel5));
								buffrgb.append(hex + ", ");
								addrcount5++;
							} catch (Exception ex) {
								ex.printStackTrace();
							}

							pixel5 = 0;
							count5 = 0;
						}

						if (count15 == 15) {
							String hex;
							try {
								hex = leadingZeros(4, Integer
										.toHexString(pixel15));
								buffbw.append(hex + ", ");
								addrcount15++;
							} catch (Exception ex) {
								ex.printStackTrace();
							}

							pixel15 = 0;
							count15 = 0;
						}
					}
				}
				buffrgb.delete(buffrgb.length() - 2, buffrgb.length() - 1);
				buffrgb.append(";");
				buffbw.delete(buffbw.length() - 2, buffbw.length() - 1);
				buffbw.append(";");
				String contentsrgb = buffrgb.toString();
				String contentsbw = buffbw.toString();
				String outputpathrgb = chooser.getSelectedFile().getParent()
						+ "\\" + chooser.getSelectedFile().getName() + ".coe";
				String outputpathbw = chooser.getSelectedFile().getParent()
						+ "\\" + chooser.getSelectedFile().getName()
						+ ".bw.coe";
				FileWriter fwrgb = new FileWriter(outputpathrgb);
				fwrgb.write(contentsrgb);
				fwrgb.close();
				FileWriter fwbw = new FileWriter(outputpathbw);
				fwbw.write(contentsbw);
				fwbw.close();
				System.out.println("COE Generated successfully. (RGB + BW)");
				System.out.println("RGB Memory addresses range: 0 to "
						+ (addrcount5 - 1) + " (HEX "
						+ Integer.toHexString((addrcount5 - 1)) + ")");
				System.out.println("BW Memory addresses range: 0 to "
						+ (addrcount15 - 1) + " (HEX "
						+ Integer.toHexString((addrcount15 - 1)) + ")");

			} catch (IOException ex) {
				ex.printStackTrace();
			}

		}
	}
}