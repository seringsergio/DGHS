import numpy as np
import matplotlib.pyplot as plt
import matplotlib.colors as mcol
import matplotlib.cm as cm

start_time = 100
end_time = 120

# Generate some dummy data.
tim = range(start_time,end_time+1)
xdat = np.arange(0,90.1)
ydat = [np.sin(0.2*(xdat-t)/np.pi) for t in tim]


# Make a user-defined colormap.
cm1 = mcol.LinearSegmentedColormap.from_list("MyCmapName",["r","b"])

# Make a normalizer that will map the time values from
# [start_time,end_time+1] -> [0,1].
cnorm = mcol.Normalize(vmin=min(tim),vmax=max(tim))

# Turn these into an object that can be used to map time values to colors and
# can be passed to plt.colorbar().
cpick = cm.ScalarMappable(norm=cnorm,cmap=cm1)
cpick.set_array([])



F = plt.figure()
A = F.add_subplot(111)
for y, t in zip(ydat,tim):
    A.plot(xdat,y,color=cpick.to_rgba(t))

plt.colorbar(cpick,label="Time (seconds)")
