
public class DNASequencing {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String DNA = "ATGGGCAAGGTT";
		char[] DNAchars = DNA.toCharArray();
		int currentCount = 1;
		char currentPrimitive=DNAchars[1];
		char maxPrimitive=DNAchars[1];
		int maxCount=1;
		
		//loop through all the characters
		for(int i = 0; i < DNAchars.length-1; i++)
		{
			//If two consecutive chars comes together then process
			if(DNAchars[i]==DNAchars[i+1])
			{
				currentCount=currentCount+1;
				currentPrimitive=DNAchars[i];
				//Assign the maximum occured primitive to the different variable.
				// Replace if found the current is bigger than older record.
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
		//Print the output
		System.out.println(Character.toString((char) maxPrimitive)+" "+Integer.toString(maxCount));	
	}

}
