## Overview

This project implements a **Self-Organizing Map (SOM)** algorithm in MATLAB, using the Iris dataset for unsupervised clustering of two-dimensional data. SOM is a type of neural network used for dimensionality reduction and data visualization by grouping similar data points together.

This code was developed as part of my Artificial Neural Networks (ANN) course project at IASBS.

## Features
- **Data Import:** Reads 2D data points from a CSV file (`iris.csv`).
- **Random Initialization:** Initializes the weights randomly in a specified grid size.
- **Dynamic Learning Rate & Neighborhood Function:** Gradually reduces the learning rate and neighborhood size over epochs.
- **Weight Update:** Adjusts the weights using a Gaussian neighborhood function.
- **Visualization:** Plots the data points and updated weight positions at each epoch.

## How to Use

### 1. Prerequisites
Ensure you have MATLAB installed with basic toolboxes and the file `iris.csv` in your working directory.

### 2. Run the Code
1. Open the script in MATLAB.
2. Run the script.
3. Provide the following inputs when prompted:
   - **Rows amount:** Number of rows in the SOM grid.
   - **Columns amount:** Number of columns in the SOM grid.
   - **Epochs amount:** Number of epochs for training.

### 3. Output
- **Visualization:** 
  - The input data points (black dots).
  - SOM weight nodes (black circles).
  - Red and blue lines connecting weight nodes to form the grid.
- **Title:** Displays the current epoch number.

## Key Parameters
- **Learning Rate:** 
  - Starts at `0.9` and decays to `0.1` over the epochs.
- **Neighborhood Size (Sigma):**
  - Starts at `10` and decays to `1` over the epochs.

## File Structure
- **`iris.csv`:** Input file containing 2D data points.
- **Script:** Main MATLAB file containing the SOM implementation.

## Code Highlights
- **Data Handling:** 
  - Reads input data from `iris.csv`.
  - Splits data into two variables for 2D visualization.
  
- **SOM Training Loop:**
  - Iterates over the epochs and adjusts weights using:
    - Euclidean distance.
    - Gaussian neighborhood function.
    - Adaptive learning rate.

- **Visualization:** 
  - Updates the figure at each epoch for interactive visualization of the learning process.

## Future Improvements
- Extend to higher-dimensional data.
- Add support for dynamic dataset loading.
- Optimize weight update logic for better performance.

## Example Visualization
At each epoch, the script visualizes the input points and the evolving SOM grid as shown below:

- **Black dots:** Data points from the dataset.
- **Black circles:** Weight nodes of the SOM.
- **Red lines:** Horizontal connections between neighboring weight nodes.
- **Blue lines:** Vertical connections between neighboring weight nodes.
