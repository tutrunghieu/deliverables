package projects.dexter;

import java.io.PrintWriter;

public class DaSys 
{
	public static void catfp(PrintWriter out, Object... args) 
	{
		for(int k=0; k<args.length; k++) {
			if(k>0) out.print(",");
			out.print("\"" + args[k] + "\"");
		}
		
		out.println();
	}

	public static void catf(Object... args) 
	{
		for(int k=0; k<args.length; k++) {
			if(k>0) System.out.print("|");
			System.out.print(args[k]);
		}
		
		System.out.println();
	}
}
