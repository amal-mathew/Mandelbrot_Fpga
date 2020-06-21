from PIL import Image
import numpy as np
import re
import sys
import matplotlib.pyplot as plt
np.set_printoptions(threshold=sys.maxsize)
# Read in entire file
s = np.loadtxt("output_file32.txt")

# Find anything that looks like numbers
# Convert to numpy array and reshape
data = np.array(s).reshape(32,32)
#print(data)
# Convert to image and save
plt.imshow(data, cmap='gray', vmin=0, vmax=255)
plt.show()

