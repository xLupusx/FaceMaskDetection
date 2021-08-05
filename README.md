# Face Mask Detection
The detection of face mask in a still image, using only image processing methods (no ML)

All images used provided by my Image Processing course's Professor

First, we import the image into MATLAB and crop it to focus only on the face
![image](https://user-images.githubusercontent.com/68658710/128357335-c61885b2-1a3e-4da9-958b-e4258e586e16.png)

Then we extract the RGB part of the image out.
![image](https://user-images.githubusercontent.com/68658710/128357396-959a16a8-ebb4-4eed-9acb-59cdebda6e4f.png)

Subtracting the red part of the image from the green part, we theorize that the part we are left with is the mask itself.
![image](https://user-images.githubusercontent.com/68658710/128357448-fbfb1231-12e6-498a-bf46-d29ffc32a536.png)

The part of the mask is then converted to binary, and the blobs are removed using blob statistics analysis.
![image](https://user-images.githubusercontent.com/68658710/128357548-a4b9e91b-0bd8-42e2-b0c3-6ed8771d54de.png)
![image](https://user-images.githubusercontent.com/68658710/128357571-93cfd0fa-95af-47ab-84a5-b61e89ab16c3.png)


Lastly, a bounding box is drawn over the leftover part, on the original image itself.
![image](https://user-images.githubusercontent.com/68658710/128357610-086f27f4-b3fe-4cde-ae02-9173ae89e871.png)

More Output Result can be seen in Step.docx
