Things of interest:

According to http://atariage.com/forums/topic/249933-blue-max-source-code-for-you/

> Courtesy of Bob Polin, the source code for Blue Max. (An interview with him is forthcoming on the ANTIC podcast.)
> On disk 2, there are two bad sectors (511 and 540) that I have been unable to read even after multiple attempts. (Not sure what those correspond to, but there are two files with 0 sectors listed in the directory.)
> Bob would like to see his source code in ASCII format, but the format of these files looks unusual to me. Normally I just export the files to my Mac then do search-replace of the RETURN characters and things look OK — but that doesn't seem to be good enough in this case - there are still weird messy characters. Can someone make a pretty version for me to send to Bob?

I have written a tool to extract the ASCII source code from the  Synapse Assembler files. The first dump had 'EXXON.3' as a duplicate of 'EXXON.4', which meant that 'EXXON.3' was missing.
