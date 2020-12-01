# LocationDetector

The purpose of this project is finding the location of a photo based on the most similar photo in the training dataset.

The dataset is available [here].(https://drive.google.com/drive/folders/1Xxv-4sDt_BlymaA4FJ9crrII554x5TJc?usp=sharing)

Download the dataset and sample test data. In the name of each training photo, the Latitude and longitude of the photo is written.

After finding the feature of each traning photo, we try to find the most relevant photos to the test photo. If we have more than one similar pictures, we can find an average of Latitude and longitude of the most relevant pictures and calculate the location of the test photo.
