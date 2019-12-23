# Electrophysiology Analysis

Analysis of neural recordings from auditory cortex of awake and behaving
Mongolian gerbils, tasked with detecting target sounds in presence of
fluctuating background interference, commonly referred to as the cocktail party
problem, or more specifically modulation masking release (MMR).

This project is a part of my PhD dissertation in the Neural Engineering of
Speech and Hearing (NESH) lab at New Jersey Institute of Technology (NJIT) and
Rutgers University, and was supported by funding from NIH NIDCD R03-DC014008.
EARS, the data acquisition complement to this project can be found at:
https://github.com/nalamat/ears

Raw behavioral and neural data are available upon reasonable request.


## Demo Results

################################################################################

A concise version of the processing pipeline used for neural signals is shown
below along with plots for a representative unit.

![Alt text](figures/pipeline.png?raw=true "Processing Pipeline")
![Alt text](figures/sample-plots.png?raw=true "Sample Plots")

Putative neural units are automatically detected using PCA and K-means
clustering, followed by manual inspection and labeling as single- or multi-unit.
(See [Hill et al. 2012](https://neurophysics.ucsd.edu/lab/UltraMegaSort2000%20Manual.pdf))

![Alt text](figures/units-1.png?raw=true "Sample Units 1")
![Alt text](figures/units-3.png?raw=true "Sample Units 3")
![Alt text](figures/units-2.png?raw=true "Sample Units 2")

Pooled neural activity across all phasic-units shows an opposite direction of
activation at negative signal-to-noise ratios. This observation is further supported
by repeated measures ANOVA.

![Pooled PSTH](figures/psth.png?raw=true)
![Target-Evoked Response](figures/target-evoked-response.png?raw=true)
![Vector Strength](figures/vector-strength.png?raw=true)


## License

This program is free software: you can redistribute it and/or modify it under
the terms of the GNU General Public License as published by the Free Software
Foundation, either version 3 of the License, or (at your option) any later
version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE. See the GNU General Public License for more details.
You should have received a copy of the GNU General Public License along with
this program. If not, see <http://www.gnu.org/licenses/>.


## Web and contact

Visit the project page at GitHub:
https://github.com/nalamat/ephys

Visit lab website:
https://centers.njit.edu/nesh

Team members:
- Prof. Antje Ihlefeld (PI)
- Dr. Pelin Avcu
- Madhusudan Duwadi
- Sravana Nuti
- Kinjal Mody

Feel free to email me about anything at:
- Nima Alamatsaz: nima.alamatsaz@gmail.com
