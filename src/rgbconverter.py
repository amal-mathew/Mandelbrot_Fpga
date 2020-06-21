from PIL import Image
import numpy as np
import re
import sys
import matplotlib.pyplot as plt
np.set_printoptions(threshold=sys.maxsize)
# Read in entire file
s = np.loadtxt("output_file.txt")

# Find anything that looks like numbers
# Convert to numpy array and reshape
data = np.array(s).reshape(256,256)
rgb = np.zeros([256,256,3], dtype=int)

for i in range (0, 255):
	for j in range (0,255):
		rgb[j][i][2] = (255 - data[i][j])/4
		rgb[j][i][0] = data[i][j]
		if(data[i][j]<=255/2):
			rgb[j][i][1] = data[i][j]*2
		if(data[i][j]>255/2):
			rgb[j][i][1] = (255 - data[i][j])*2
			
#print(data)
# Convert to image and save
plt.imshow(rgb, cmap='gray', vmin=0, vmax=255)
plt.show()
