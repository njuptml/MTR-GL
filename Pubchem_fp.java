import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;

import org.openscience.cdk.fingerprint.PubchemFingerprinter;
import org.openscience.cdk.interfaces.IAtomContainer;
import org.openscience.cdk.interfaces.IChemObjectBuilder;
import org.openscience.cdk.silent.SilentChemObjectBuilder;
import org.openscience.cdk.smiles.SmilesParser;

public class Pubchem_fp {
	public static void main(String[] args) throws Exception {
		IChemObjectBuilder build=SilentChemObjectBuilder.getInstance();
		SmilesParser parser=new SmilesParser(build);
		PubchemFingerprinter fprinter=new PubchemFingerprinter(build);

		BufferedReader br= new BufferedReader(new FileReader("C:\\Users\\deepn\\Desktop\\SGL\\UserInputData.txt"));
		BufferedWriter bw=new BufferedWriter(new FileWriter("C:\\Users\\deepn\\Desktop\\SGL\\output_fp.txt"));
		String line=br.readLine();
		bw.write(line);
		bw.newLine();

		int t=0;
		while((line=br.readLine())!=null){
			System.out.println(t++);
			String[] s=line.split("\t");
			IAtomContainer imole=parser.parseSmiles(s[1]);
		    int[] bf=fprinter.getBitFingerprint(imole).getSetbits();
		    bw.write(line);
		    bw.write("\t");
		    int temp=0;
		    for(int i=0;i<881;i++){
		    	if(i==bf[temp]){
		    		bw.write("1");
		    		if(temp<bf.length-1){
		    			temp++;
		    		}
		    	}else{
		    	bw.write("0");
		    	}
		    	bw.write("\t");
		    }
		    bw.newLine();
		}
		br.close();
		bw.close();
	}
}