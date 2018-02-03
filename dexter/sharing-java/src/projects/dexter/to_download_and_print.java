package projects.dexter;

import java.net.URL;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;

public class to_download_and_print {

	public static void main(String[] args) throws Exception
	{
		String lk = "https://en.wikipedia.org/wiki/Dexter_(season_1)";
		
		Document dk = Jsoup.parse(new URL(lk), 5000);
		
		selectPeople(dk);
	}

	private static void selectPeople(Document dk) 
	{
		for(Element ek: dk.select("li")) {
			String tk = ek.text();
			if( !tk.contains(" as ") ) continue;
			if( tk.contains(" as PDF") ) continue;
			
			for(Element aj: ek.select("a")) {
				String nj = aj.text();
				String tj = tk.contains(nj + " as") ? "actor" : "character";
				String lj = aj.absUrl("href");
				
				DaSys.catf(nj, tj, lj);
			} //for each link in li
		} //for each li
		
		return;
	}


}
