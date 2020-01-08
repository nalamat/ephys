import numpy as np
import matplotlib.pyplot as plt
from sklearn.svm import SVC
from sklearn.model_selection import train_test_split
from scipy.io import loadmat

file = 'AnalysisNJIT/CMR05Fluffy-20.mat'
session = 0

mat = loadmat(file)
analysis = mat['analysis']
a = analysis[session,0][0,0]
channels = a['channels'][0]
units = a['units']

mapping = np.array([
    [15, 10, 2, 3],
    [13, 12, 4, 1],
    [8, 11, np.nan, 7],
    [9, 14, 5, 6 ]
    ])

fig, axes = plt.subplots(4,4)
fig.tight_layout()

for unitID in range(0, units.shape[1]):
# for unitID in range(0, 3):
    u = units[0,unitID][0,0]
    bins = u['psthCenters'][0]
    nogo = u['psth'][0,0]
    ax = axes[tuple(np.argwhere(mapping==channels[unitID])[0])]

    for condID in range(1,u['condCount'][0][0]):
        go = u['psth'][0,condID]

        times = np.arange(.01, 1, .05)
        scores = np.zeros(len(times))
        scores_std = np.zeros(len(times))

        for i in range(len(times)):
            mask = (0<=bins) & (bins<=times[i])
            x0 = nogo[:, mask]
            x1 = go[:, mask]

            x = np.r_[x0, x1]
            y = np.repeat([0, 1], [x0.shape[0], x1.shape[0]])

            reps = 50
            scores2 = np.zeros(reps)
            for j in range(reps):
                x_train, x_test, y_train, y_test = train_test_split(
                    x, y, test_size=.25)

                clf = SVC(gamma='auto')
                clf.fit(x_train, y_train)
                scores2[j] = clf.score(x_test, y_test)
            scores[i] = scores2.mean()
            scores_std[i] = scores2.std()

            # clf = SVC(gamma='auto')
            # clf.fit(x, y)
            # scores[i] = clf.score(x, y)

        ax.plot(times, scores)
        # ax.errorbar(times, scores, yerr=scores, fmt='-o')

    ax.legend([str(level)+' dB' for level in u['targetLevels'][0]],
        prop={'size': 7})
    ax.set_ylim([.5,1])
    ax.set_title(u['label'][0])

fig.suptitle(a['dataFile'][0])
fig.show()
