
public class DNASequencing {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String DNA = "ATGGGCAAGGTT";
		char[] DNAchars = DNA.toCharArray();
		int currentCount = 1;
		char currentPrimitive=DNAchars[1];
		char maxPrimitive=DNAchars[1];
		int maxCount=1;
		
		for(int i = 0; i < DNAchars.length-1; i++)
		{
			if(DNAchars[i]==DNAchars[i+1])
			{
				currentCount=currentCount+1;
				currentPrimitive=DNAchars[i];
				if(maxCount < currentCount)
				{
					maxCount = currentCount;
					maxPrimitive = currentPrimitive;
				}
			}else
			{
				currentCount=1;
			}			
		}
		System.out.println(Character.toString((char) maxPrimitive)+" "+Integer.toString(maxCount));	
	}

}
