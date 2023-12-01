Usage command: python3 ExpectedAnalysis.py <text file> <window size>

The text file is a file where each line has just one float value. All these values are the expected breathing values. Window size represents how to smooth the expected breathing graph. The comma separated output array values corresponding to filtered expected breathing data will be stored in output.txt.

Example: python3 ExpectedAnalysis.py Box-2.txt 10