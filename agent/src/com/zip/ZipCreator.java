package com.zip;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.zip.Deflater;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import org.apache.log4j.Logger;

import com.wallettowallet.WallettoWalletDao;


public class ZipCreator {
	Logger logger=Logger.getLogger(ZipCreator.class);

	public String createRarFile(String filesToZip, String zipFileName) {

		String result = "";

		try {
			File f = new File(filesToZip);
			if (!f.exists()) {
				result = "filenotfound";
			}

			else {
				byte[] buffer = new byte[18024];

				ZipOutputStream out = new ZipOutputStream(new FileOutputStream(zipFileName));
				out.setLevel(Deflater.DEFAULT_COMPRESSION);
				FileInputStream in = new FileInputStream(filesToZip);
				out.putNextEntry(new ZipEntry(filesToZip));
				int len;
				while ((len = in.read(buffer)) > 0) {
					out.write(buffer, 0, len);
				}
				out.closeEntry();
				in.close();
				out.close();
				result=zipFileName;
			}
		} catch (IllegalArgumentException iae) {
			iae.printStackTrace();
			result="error";
		} catch (FileNotFoundException fnfe) {
			fnfe.printStackTrace();
			result="error";
		} catch (IOException ioe) {
			ioe.printStackTrace();
			result="error";
		}
		catch (Exception ex) {
			ex.printStackTrace();
			result="error";
		}
		return result;
	}

}
