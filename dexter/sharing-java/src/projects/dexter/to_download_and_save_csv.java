package projects.dexter;

import java.io.File;
import java.io.PrintWriter;
import java.net.URL;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;

public class to_download_and_save_csv {


	public static void main(String[] args) throws Exception
	{
		String lk = "https://en.wikipedia.org/wiki/Dexter_(season_1)";
		
		Document dk = Jsoup.parse(new URL(lk), 5000);
		
		File outf = new File(args.length==0 
				? System.getProperty("user.home") + "/Desktop/out.dexter.people.csv"
				: args[0]);
		
		selectPeople(dk, outf);
	}

	private static void selectPeople(Document dk, File f) throws Exception 
	{
		f.getParentFile().mkdirs();
		PrintWriter out = new PrintWriter(f);
		out.println("name,type,link");
		
		for(Element ek: dk.select("li")) {
			String tk = ek.text();
			if( !tk.contains(" as ") ) continue;
			if( tk.contains(" as PDF") ) continue;
			
			for(Element aj: ek.select("a")) {
				String nj = aj.text();
				String tj = tk.contains(nj + " as") ? "actor" : "character";
				String lj = aj.absUrl("href");
				
				DaSys.catfp(out, nj, tj, lj);
			} //for each link in li
		} //for each li
		
		out.close();
	}

}
